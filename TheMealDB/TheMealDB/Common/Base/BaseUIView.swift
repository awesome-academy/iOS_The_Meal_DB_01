//
//  BaseUIView.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

public class BaseUIView: UIView, ReuseView {
    func initialize() {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
