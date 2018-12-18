//
//  MealRepositoty.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

protocol MealRepository {
    func getMeal(completion: @escaping (BaseResult<MealResult>) -> Void)
}

class MealRepositoryImp: MealRepository {
    private let api: APIService
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getMeal(completion: @escaping (BaseResult<MealResult>) -> Void) {
        let input = MealRequest()
        api.request(input: input) { (object: MealResult?, error) in
            guard let object = object else {
                guard let error = error else {
                    completion(.failure(error: nil))
                    return
                }
                completion(.failure(error: error))
                return
            }
            completion(.success(object))
        }
    }
}
