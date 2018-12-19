//
//  CustomTableViewCell.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    //  MARK: - UI Propertis
    private let mealView = CustomMealView()
    
    //  MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(mealView)
        mealView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    //  MARK: - Configuage
    func configuage(data: Meal) {
        guard let url = URL(string: data.strMealThumb) else {
            return
        }
        mealView.mealThumbImage.sd_setImage(with: url, completed: nil)
        mealView.categoryText = data.strCategory
        mealView.mealText = data.strMeal
        mealView.idMealText = data.idMeal
        mealView.areaText = data.strArea
    }
}
