//
//  BaseViewController.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

protocol ReuseView {
    func initialize()
}

public class BaseViewController: UIViewController, ReuseView {
    public func initialize() {
        view.backgroundColor = #colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
