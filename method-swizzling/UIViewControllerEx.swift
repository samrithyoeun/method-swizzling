//
//  UIViewControllerEx.swift
//  method-swizzling
//
//  Created by Yoeun Samrith on 5/7/20.
//  Copyright © 2020 Yoeun Samrith. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func swizzlePresent() {
    
    let orginalSelector = #selector(present(_: animated: completion:))
    let swizzledSelector = #selector(shouldPresent)
    
    guard let orginalMethod = class_getInstanceMethod(self, orginalSelector), let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else{return}
    
    let didAddMethod = class_addMethod(self,
                                       orginalSelector,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
        class_replaceMethod(self,
                            swizzledSelector,
                            method_getImplementation(orginalMethod),
                            method_getTypeEncoding(orginalMethod))
    } else {
        method_exchangeImplementations(orginalMethod, swizzledMethod)
        }
        
    }
    
        
    @objc
    private func shouldPresent(_ viewControllerToPresent: UIViewController,
                                 animated flag: Bool,
                                 completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            if viewControllerToPresent.modalPresentationStyle == .pageSheet || viewControllerToPresent.modalPresentationStyle == .automatic {
                viewControllerToPresent.modalPresentationStyle = .fullScreen
            }
        }
        shouldPresent(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    
}
