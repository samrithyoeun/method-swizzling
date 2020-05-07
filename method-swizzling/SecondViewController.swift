//
//  SecondViewController.swift
//  method-swizzling
//
//  Created by Yoeun Samrith on 5/7/20.
//  Copyright © 2020 Yoeun Samrith. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    static func instantiate() -> SecondViewController {
        return UIStoryboard.init(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second View Controller"
        self.view.backgroundColor = .lightGray
    }
    
    @IBAction func closeButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

