//
//  CustomTableViewCell.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //  MARK: UI Propertis
    private let mealView = CustomMealView()
    
    //  MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(mealView)
        mealView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(232)
        }
    }
    
    //  MARK: Configuage
    public func Configuage(data: UIImage) {
        mealView.mealThumb = data
    }
}
