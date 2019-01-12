//
//  Categrory.swift
//  TheMealDB
//
//  Created by mac on 12/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class Categrory : Mappable {
    var strCategory = ""
    var strCategoryThumb = ""
    var idCategory = ""
    
    init() {
        self.strCategory = ""
        self.strCategoryThumb = ""
        self.idCategory = ""
    }
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        strCategory <- map["strCategory"]
        strCategoryThumb <- map["strCategoryThumb"]
        idCategory <- map["idCategory"]
    }
}
