//
//  CategroryArray.swift
//  TheMealDB
//
//  Created by mac on 12/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class CategroryArray : Mappable {
    
    var categories = [Categrory]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        categories <- map["categories"]
    }
}
