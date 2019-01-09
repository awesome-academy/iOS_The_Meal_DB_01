//
//  HeaderAMealScreen.swift
//  TheMealDB
//
//  Created by mac on 1/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

final class HeaderAMealScreen: UICollectionViewCell {

    @IBOutlet private weak var foodImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var areaLabel: UILabel!
    @IBOutlet private weak var howToCook: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for view in subviews {
            print(view)
        }
    }

    func configure(data: Meal) {
        let url = URL(string: data.strMealThumb)
        foodImage.sd_setImage(with: url, completed: nil)
        categoryLabel.text = data.strCategory
        nameLabel.text = data.strMeal
        idLabel.text = data.idMeal
        areaLabel.text = data.strArea
        howToCook.text = data.strInstructions
    }
}
