//
//  MealArray.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class MealResult : Mappable {
    
    var meals = [Meal]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        meals <- map["meals"]
    }
}
