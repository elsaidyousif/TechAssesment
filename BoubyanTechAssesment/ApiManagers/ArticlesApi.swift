//
//  ArticlesApi.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 1/2/22.
//

import Foundation
import Moya

// Articel Api Manager
enum ArticlesApi {
    case getArticlessData(period: Int)
}

extension ArticlesApi:TargetType  , AccessTokenAuthorizable{
    var authorizationType: AuthorizationType? {
        switch self {
        case .getArticlessData(_):
            return .none
        }
    }
    var baseURL : URL {
        return URL(string:WebService.BaseURL)!
    }
    var path: String {
        switch self {
        case .getArticlessData(let period):
            return "\(period).json"
        }
    }
    var method : Moya.Method {
        switch self {
        case .getArticlessData(_):
            return .get
        }
    }
    var task : Task {
        switch self {
        case .getArticlessData(_):
            return .requestParameters(parameters: ["api-key":"v0PBuIAAlzGV7Ih7mU9lylnp3KM8W1B9"], encoding: URLEncoding.default)
            
        }
    }
    
    var headers : [String : String]? {
        return ["Content-type": "application/json" , "Accept-Encoding" : "application/json"  ,"Accept" :"application/json"]
    }
    var sampleData: Data { return Data()
        
    }  // We just need to return something here to fully implement the protocol
    
}

