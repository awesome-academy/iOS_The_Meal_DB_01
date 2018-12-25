//
//  UIViewCornerRadius.swift
//  TheMealDB
//
//  Created by mac on 1/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

extension UIView {
    func roundedUsingWidth() {
        self.rounded(cornerRadius: self.frame.size.width / 2)
    }
    
    func roundedUsingHeight() {
        self.rounded(cornerRadius: self.frame.size.height / 2)
    }
    
    func rounded(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}

