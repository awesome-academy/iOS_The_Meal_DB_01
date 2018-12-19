//
//  MealRequest.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class MealRequest: BaseRequest {
    required init () {
        super.init(url: URLs.meal, requestType: .get)
    }
}
