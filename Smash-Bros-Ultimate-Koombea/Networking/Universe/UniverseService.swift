//
//  UniverseService.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 21/01/22.
//

import Foundation
import Alamofire

protocol UniverseServiceProtocol{
    func getFighters(request: FighterRequest, completion: @escaping ([UniverseResponse]?, Error?) -> Void)
}

class UniverseService: UniverseServiceProtocol {
    
    func getFighters(request: FighterRequest, completion: @escaping ([UniverseResponse]?, Error?) -> Void) {
        var endPoint: UniverseEndPoint = .getUniverses
        print("URL ---------->",endPoint.toURL())
        print("URL ---------->")
        AF.request(endPoint.toURL(), method: endPoint.method)
            .response {[weak self] response in
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        return
                    }
                    do {
                        let response = try JSONDecoder().decode([UniverseResponse].self, from: data)
                        completion(response, nil)
                    } catch {
                        completion(nil,error)
                    }
                case .failure(let error):
                    completion(nil,error)
                }
            }
    }
}
