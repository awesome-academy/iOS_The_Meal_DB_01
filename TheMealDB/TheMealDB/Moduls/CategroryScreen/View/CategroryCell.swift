//
//  CategroryCell.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

final class CategroryCell: UICollectionViewCell {
    @IBOutlet weak private var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 1
    }
    
    func configuage(data: UIImage) {
        categoryImage.image = data
    }
}
