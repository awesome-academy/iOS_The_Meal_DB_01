//
//  Meal.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class Meal : Mappable {
    var idMeal = ""
    var strMeal = ""
    var strArea = ""
    var strCategory = ""
    var strInstructions = ""
    var strMealThumb = ""
    var resources = [FoodResource]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    init() {
        self.idMeal = ""
        self.strMeal = ""
        self.strArea = ""
        self.strCategory = ""
        self.strInstructions = ""
        self.strMealThumb = ""
        self.resources = [FoodResource]()
    }
    
    func mapping(map: Map) {
        idMeal <- map["idMeal"]
        strMeal <- map["strMeal"]
        strArea <- map["strArea"]
        strCategory <- map["strCategory"]
        strInstructions <- map["strInstructions"]
        strMealThumb <- map["strMealThumb"]
        (1...Constants.endArray).forEach { index in
            var ingredient = ""
            var measure = ""
            ingredient <- map["strIngredient\(index)"]
            measure <- map["strMeasure\(index)"]
            if ingredient != "" {
                resources.append(FoodResource(ingredient: ingredient, measure: measure))
            }
        }
    }
}

struct FoodResource {
    var ingredient: String
    var measure: String
}

struct Constants {
    static let endArray = 20
}
