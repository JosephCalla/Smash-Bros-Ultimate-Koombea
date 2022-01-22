//
//  UniverseEndpoint.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import Foundation
import Alamofire

enum UniverseEndPoint: EndPoint {
        
    case getUniverses
    
    var apiKey: String {
        return ""
    }
    
    var baseURL: String {
        return "https://593cdf8fb56f410011e7e7a9.mockapi.io"
    }
    
    var path: String {
        switch self {
        case .getUniverses:
            return "/universes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUniverses:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getUniverses:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getUniverses:
            return nil
        }
    }
}
