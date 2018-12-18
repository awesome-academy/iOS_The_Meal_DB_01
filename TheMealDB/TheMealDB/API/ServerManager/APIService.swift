//
//  API.swift
//  Structure_IOS
//
//  Created by DaoLQ on 10/21/17.
//  Copyright © 2017 DaoLQ. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

struct APIService {
    
    static let share = APIService()
    
    private var alamofireManager = Alamofire.SessionManager.default
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request<T: Mappable>(input: BaseRequest, completion: @escaping (_ value: T?,_ error: BaseError?) -> Void) {
        alamofireManager.request(input.url, method: input.requestType, parameters: input.body, encoding: input.encoding)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let statusCode = response.response?.statusCode {
                        if statusCode == 200 {
                            let object = Mapper<T>().map(JSONObject: value)
                            completion(object, nil)
                        } else {
                            if let error = Mapper<ErrorResponse>().map(JSONObject: value) {
                                completion(nil, BaseError.apiFailure(error: error))
                            } else {
                                completion(nil, BaseError.httpError(httpCode: statusCode))
                            }
                        }
                    } else {
                        completion(nil, BaseError.unexpectedError)
                    }
                    break
                case .failure(let error):
                    completion(nil, error as? BaseError)
                    break
                }
        }
    }
}
