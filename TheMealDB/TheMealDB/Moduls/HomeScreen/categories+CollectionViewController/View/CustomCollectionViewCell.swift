//
//  CustomCollectionViewCell.swift
//  
//
//  Created by mac on 11/27/18.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: UIImage) {
        imageItem.image = data
    }
}
