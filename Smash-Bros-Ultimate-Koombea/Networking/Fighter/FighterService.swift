//
//  FighterService.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import Foundation
import Alamofire

protocol FighterServiceProtocol{
    func getFighters(request: FighterRequest, completion: @escaping ([FighterResponse]?, Error?) -> Void)
}

class FighterService: FighterServiceProtocol {
    
    func getFighters(request: FighterRequest, completion: @escaping ([FighterResponse]?, Error?) -> Void) {
        var endPoint: FighterEndPoint = .getFighters
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
                        let response = try JSONDecoder().decode([FighterResponse].self, from: data)
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
