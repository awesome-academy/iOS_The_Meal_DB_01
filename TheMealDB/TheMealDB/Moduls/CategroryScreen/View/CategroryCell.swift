//
//  CategroryCell.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

final class CategroryCell: UICollectionViewCell {
    @IBOutlet weak var categroryNameLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 5
    }
    
    func configuage(data: Categrory) {
        categroryNameLabel.text = data.strCategory
        categroryNameLabel.font = .helveticaNeue(fontSize: 15)
        let url = URL(string: data.strCategoryThumb)
        categoryImage.sd_setImage(with: url, completed: nil)
    }
}
