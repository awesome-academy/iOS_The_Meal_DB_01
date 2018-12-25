//
//  CategroryCell.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

final class CategroryCell: UICollectionViewCell {
    @IBOutlet weak private var categroryNameLabel: UILabel!
    @IBOutlet weak private var categoryImage: UIImageView!
    @IBOutlet weak private var blurCategroryNameView: UIVisualEffectView!
    @IBOutlet weak private var blurCategroryIDView: UIVisualEffectView!
    @IBOutlet weak private var categoryIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        rounded(cornerRadius: 5)
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.borderWidth = 2
        setupCategoryImage()
        setupBlurCategroryNameView()
        setupBlurCategroryIDView()
    }
    
    private func setupCategoryImage() {
        categoryImage.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    private func setupBlurCategroryNameView() {
        blurCategroryNameView.rounded(cornerRadius: 10)
        blurCategroryNameView.clipsToBounds = true
    }
    
    private func setupBlurCategroryIDView() {
        blurCategroryIDView.roundedUsingWidth()
        blurCategroryIDView.clipsToBounds = true
    }
    
    func configuage(data: CategroryItem) {
        categroryNameLabel.text = data.strCategory
        categroryNameLabel.font = .helveticaNeue(fontSize: 15)
        let url = URL(string: data.strCategoryThumb)
        categoryImage.sd_setImage(with: url, completed: nil)
        categoryIDLabel.text = data.idCategory
    }
}
