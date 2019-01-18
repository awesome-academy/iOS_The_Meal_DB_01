//
//  HeaderCell.swift
//  TwitterLBTA
//
//  Created by mac on 1/8/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

final class HeaderCell: UICollectionViewCell {
    
    @IBOutlet weak private var categoryImage: UIImageView!
    @IBOutlet weak private var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: Categrory) {
        let url = URL(string: data.strCategoryThumb)
        categoryImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "noImage"))
//        categoryName.text = data.strCategory
    }
}
