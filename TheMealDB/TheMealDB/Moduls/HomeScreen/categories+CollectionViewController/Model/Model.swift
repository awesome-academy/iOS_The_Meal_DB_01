//
//  Model.swift
//  TheMealDB
//
//  Created by mac on 11/30/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoriesArray: Mappable {
    var categories: [CategoriesItem]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        categories <- map["categories"]
    }
}

class CategoriesItem: Mappable {
    var strCategory = ""
    var strCategoryThumb = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        strCategory <- map["strCategory"]
        strCategoryThumb <- map["strCategoryThumb"]
    }
}
