//
//  SearchRequest.swift
//  Structure_IOS
//
//  Created by DaoLQ on 10/21/17.
//  Copyright © 2017 DaoLQ. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class CategroryRequest: BaseRequest {
    required init () {  
        super.init(url: URLs.categrory, requestType: .get)
    }
}
