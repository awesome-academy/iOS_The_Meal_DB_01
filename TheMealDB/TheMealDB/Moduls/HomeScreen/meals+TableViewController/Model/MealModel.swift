//
//  MealHomeScreenModel.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

public struct MealModel {
    private let idMeal: String
    private let strMeal: String
    private let strCategory: String
    private let strArea: String
    private let strInstructions: String
    private let strMealThumb: String
    private let strTags: String
    
    init?(data: [String: Any]) {
        guard let idMeal = data["idMeal"] as? String,
        let strMeal = data["strMeal"] as? String,
        let strCategory = data["strCategory"] as? String,
        let strArea = data["strArea"] as? String,
        let strInstructions = data["strInstructions"]  as? String,
        let strMealThumb = data["strMealThumb"]  as? String,
        let strTags = data["strMealThumb"]  as? String else {
            return nil
        }
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strTags = strTags
    }
}
