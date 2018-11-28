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
        view.backgroundColor = .white
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
