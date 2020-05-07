//
//  ViewController.swift
//  method-swizzling
//
//  Created by Yoeun Samrith on 5/7/20.
//  Copyright © 2020 Yoeun Samrith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        self.title = "First ViewController"
        super.viewDidLoad()
        
    }

    @IBAction func buttonDidTapped(_ sender: UIButton) {
        let secondViewController = SecondViewController.instantiate()
        let nav = UINavigationController(rootViewController: secondViewController)
        
        self.present(nav, animated: true, completion: nil)
    }

}

