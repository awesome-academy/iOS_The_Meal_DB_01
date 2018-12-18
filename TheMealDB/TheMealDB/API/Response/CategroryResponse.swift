//
//  SearchResponse.swift
//  Structure_IOS
//
//  Created by DaoLQ on 10/22/17.
//  Copyright © 2017 DaoLQ. All rights reserved.
//

import Foundation
import ObjectMapper

class CategroryResponse : Mappable {
    
    var categories = [CategroryItem]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        categories <- map["categories"]
    }
}
