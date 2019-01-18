//
//  UIView.swift
//  TheMealDB
//
//  Created by mac on 1/16/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

extension UIView {
    func roundedUsingWidth() {
        rounded(cornerRadius: frame.size.width / 2)
    }
    
    func roundedUsingHeight() {
        rounded(cornerRadius: frame.size.height / 2)
    }
    
    func rounded(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
