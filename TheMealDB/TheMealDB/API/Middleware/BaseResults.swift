//
//  BaseResults.swift
//  TheMealDB
//
//  Created by mac on 12/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

enum BaseResult<T: Mappable> {
    case success(T?)
    case failure(error: BaseError?)
}
