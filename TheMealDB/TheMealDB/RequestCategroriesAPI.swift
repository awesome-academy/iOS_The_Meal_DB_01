//
//  RequestCategroriesAPI.swift
//  TheMealDB
//
//  Created by mac on 12/5/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

func getCategroriesAPI() -> [CategoriesItem]{
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
        return [CategoriesItem]()
    }
    var jsonString: String?
    do {
        jsonString = try String.init(contentsOf: url)
        let categoriesObject = CategorieModel(JSONString: jsonString!)
        guard let categoriesArray = categoriesObject?.categories else {
            return [CategoriesItem]()
        }
        return categoriesArray
    } catch  {
        jsonString = nil
    }
    return [CategoriesItem]()
}
