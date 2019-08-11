//
//  ApiService.swift
//  Baron
//
//  Created by Arlid on 8/08/19.
//  Copyright © 2018 SingleClick. All rights reserved.
//

import Foundation
import Alamofire

public enum HttpStatusCode : Int {
    case SUCCESS = 200
    case BAD_REQUEST = 400
    case INTERNAL_SERVER_ERROR = 500
}

protocol ApiServiceProtocol {
    func get(endpoint: String, params: [String : Any]?, completionBlock: @escaping (Any?, Any?) -> Void)
    func post(endpoint: String, params: [String : Any]?, completionBlock: @escaping (Any?, Any?) -> Void)
}

class ApiService : NSObject, ApiServiceProtocol {
    
    private static var sharedApiService: ApiService = {
        let sharedResource = ApiService()
        return sharedResource
    }()
    
    private let BASIC_URL: String = Constants.Texts.API_INFO.URL
    private let WS_INFO = [
        "usuario": Constants.Texts.API_INFO.USR,
        "clave": Constants.Texts.API_INFO.PASS,
        "llave": Constants.Texts.API_INFO.KEY
    ]
    
    class func shared() -> ApiService {
        return sharedApiService
    }
    
    func constructParameters(serviceName: String, info: [String : Any]?) -> [String : Any] {
        var params = [String: Any]()
        
        params["ws_login"] = WS_INFO
        params["metodo"] = serviceName
        params["data"] = info
        
        return params
    }
    
    func get(endpoint: String, params: [String : Any]?, completionBlock: @escaping (Any?, Any?) -> Void) {
        Alamofire.request(endpoint, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            if (response.response != nil) {
                let status = response.response!.statusCode
                
                switch status {
                case HttpStatusCode.SUCCESS.rawValue:
                    if let value = response.result.value {
                        // call completionBlock with no error
                        completionBlock(nil, value)
                    }
                default:
                    completionBlock(Error.self, nil)
                }
            } else {
                completionBlock(Error.self, nil)
            }
        }
    }
    
    // Esta función recbe tres parametros (endpoint, params, funcion anonima)
    func post(endpoint: String, params: [String : Any]?, completionBlock: @escaping (Any?, Any?) -> Void) {
        let serviceParams = constructParameters(serviceName: endpoint, info: params)
        
        Alamofire.request(BASIC_URL, method: .post, parameters: serviceParams, encoding: JSONEncoding.default).responseJSON { response in
            if (response.response != nil) {
                let status = response.response!.statusCode
                
                switch status {
                    case HttpStatusCode.SUCCESS.rawValue:
                        if let value = response.result.value {
                            let successResponse = APIServiceResponseModel.fromDictionary(value as! [String : Any])
                            // call completionBlock with no error
                            completionBlock(nil, successResponse)
                        }
                    default:
                        completionBlock(Error.self, nil)
                }
            } else {
                completionBlock(Error.self, nil)
            }
        }
    }
}
