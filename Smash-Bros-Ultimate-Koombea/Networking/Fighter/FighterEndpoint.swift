//
//  FighterEndpoint.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import Foundation
import Alamofire

enum FighterEndPoint: EndPoint {
        
    case getFighters
    case getFightersByUniverse(fighter: String)
    
    var apiKey: String {
        return ""
    }
    
    var baseURL: String {
        return "https://593cdf8fb56f410011e7e7a9.mockapi.io"
    }
    
    var path: String {
        switch self {
        case .getFighters:
            return "/fighters"
        case .getFightersByUniverse(let fighter):
            return "/fighters?universe=\(fighter)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFighters:
            return .get
        case .getFightersByUniverse(fighter: let fighter):
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getFighters:
            return URLEncoding.default
        case .getFightersByUniverse(let fighter):
            return ["universe": String(fighter)] as! ParameterEncoding
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getFighters, .getFightersByUniverse:
            return nil
        }
    }
}
