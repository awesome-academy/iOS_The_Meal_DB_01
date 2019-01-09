//
//  IngredientsCell.swift
//  TheMealDB
//
//  Created by mac on 12/20/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

final class IngredientsCell: UICollectionViewCell {
    @IBOutlet weak private var foodResource: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuage(data: FoodResource) {
        foodResource.text = data.ingredient + data.measure
        foodResource.font = .helveticaNeue(fontSize: 17)
    }
}
