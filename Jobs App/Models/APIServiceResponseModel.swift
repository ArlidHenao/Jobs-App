//
//  APIServiceResponseModel.swift
//  Baron
//
//  Created by Julian on 5/30/18.
//  Copyright © 2018 SingleClick. All rights reserved.
//

import Foundation

enum APIServiceResponseType: String {
    case Confirmation = "Confirmacion"
    case Error = "Error"
    case Unknown
}

struct APIServiceResponseModel {
    let messageId: String
    let messageText: String
    let messageCode: String
    let messageType: APIServiceResponseType
    let data: [String: Any]
    let dataArray: [Any]
    let itemsCount: Int?
    
    static func fromDictionary(_ dictionary: [String: Any]) -> APIServiceResponseModel {
        return APIServiceResponseModel(
            messageId: dictionary["idmensaje"] as! String,
            messageText: dictionary["mensaje"] as! String,
            messageCode: dictionary["codigomensaje"] as! String,
            messageType: APIServiceResponseType.init(rawValue: ((dictionary["tipomensaje"] ?? "") as! String))!,
            data: (dictionary["data"] as? [String: Any]) ?? [String: Any](),
            dataArray: (dictionary["data"] as? [Any]) ?? [Any](),
            itemsCount: ((dictionary["totalregistros"] as? NSString) ?? "0").integerValue)
    }
}
