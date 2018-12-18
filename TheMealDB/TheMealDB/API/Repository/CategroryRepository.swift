//
//  CategroryRepository.swift
//  TheMealDB
//
//  Created by mac on 12/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

protocol CategoryRepository {
    func getCategory(completion: @escaping (BaseResult<CategroryArray>) -> Void)
}

class CategoryRepositoryImp: CategoryRepository {
    private let api: APIService
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getCategory(completion: @escaping (BaseResult<CategroryArray>) -> Void) {
        let input = CategroryRequest()              
        api.request(input: input) { (object: CategroryArray?, error) in
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
