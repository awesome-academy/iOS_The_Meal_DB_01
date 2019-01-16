//
//  CustomTableViewCell.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class MealCell: UICollectionViewCell {
    //  MARK: - UI Element
    @IBOutlet weak private var mealImage: UIImageView!
    @IBOutlet weak private var categoryNameLabel: UILabel!
    @IBOutlet weak private var mealNameLabel: UILabel!
    
    //  MARK: - Configuage
    func configuage(data: Meal) {
        let url = URL(string: data.strMealThumb)
        mealImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "noImage"))
        categoryNameLabel.text = data.strCategory
        mealNameLabel.text = data.strMeal
    }
}
