//
//  CustomCollectionViewCell.swift
//
//
//  Created by mac on 11/27/18.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
    }
    
    func configure(categoryItem: CategoriesItem) {
        imageItem.kf.setImage(with: URL(string: categoryItem.strCategoryThumb))
    }
}
