//
//  MealHomeScreenModel.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class MealArray: Mappable {
    var meals: [MealItem]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        meals <- map["meals"]
    }
}

class MealItem: Mappable {
    var mealId = ""
    var mealName = ""
    var category = ""
    var area = ""
    var instructions = ""
    var mealThumb = ""
    var tags = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        mealId <- map["idMeal"]
        mealName <- map["strMeal"]
        category <- map["strCategory"]
        area <- map["strArea"]
        instructions <- map["strInstructions"]
        mealThumb <- map["strMealThumb"]
        tags <- map["strTags"]
    }
}
