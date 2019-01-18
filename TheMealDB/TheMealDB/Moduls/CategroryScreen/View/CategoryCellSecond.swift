//
//  CategoryCellSecond.swift
//  TheMealDB
//
//  Created by mac on 1/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CategoryCellSecond: UICollectionViewCell {

    @IBOutlet weak private var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 2
    }
    
    func configure(data: Categrory) {
        categoryName.text = data.strCategory
    }
}
