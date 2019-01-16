//
//  CustomCollectionViewDelegate.swift
//  TheMealDB
//
//  Created by mac on 1/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

protocol CustomCollectionViewDelegate: class {
    func showAlert(error: BaseError)
    func showCategoryMeal(category: Categrory, mealsOfACategrory: [Meal])
    func showAMeal(meal: Meal)
}
