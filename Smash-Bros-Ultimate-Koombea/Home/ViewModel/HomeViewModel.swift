//
//  HomeViewModel.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import Foundation
import Alamofire

protocol HomeViewModelProtocol: AnyObject {
    func getFighters()
    func getUnivers()
    func getCache(id:NSString) -> UIImage?
    
    var delegate: HomeViewModelDelegate? {get set}
    var service: FighterServiceProtocol { get }
}

protocol HomeViewModelDelegate: AnyObject {
    func getFighters(fighters: [Fighter]?, error: Error?)
    func getUniverse(universe: [UniverseResponse]?, error: Error?)
}

class HomeViewModel: HomeViewModelProtocol {

    var service: FighterServiceProtocol
    var serviceUniverse = UniverseService()
    var delegate: HomeViewModelDelegate?
    
    static let cache = NSCache<NSString, UIImage>()
    
    init(service: FighterServiceProtocol) {
        self.service = service
    }
    
    func getFighters() {
        
        let request = FighterEndPoint.getFightersByUniverse(fighter: "Mario")
        
        self.service.getFighters(request: FighterRequest()) {[weak self] response, error in
            let urlImage = ""
            if let error = error {
                self?.delegate?.getFighters(fighters: nil, error: error)
                return
            }
            
            guard let response = response else { return }
            var fighters = [Fighter]()
            
            for fighterData in response {
                var fighter = Fighter(objectID: fighterData.objectID,
                                      title: fighterData.name,
                                      description: fighterData.fighterDescription,
                                      fighterIimageURL: fighterData.imageURL,
                                      universe: fighterData.universe,
                                      price: fighterData.price,
                                      download: fighterData.downloads,
                                      rate: fighterData.rate)
                
                //                fighter.fighterImage =
                //                fighter.posterPath = urlImage + fighterData.posterPath
                //                fighter.backdropImage = HomeViewModel.cache.object(forKey: fighter.idBackdropPath)
                //                fighter.posterImage = HomeViewModel.cache.object(forKey: fighter.idPosterPath)
                //
                //                    if Fighter.backdropImage == nil {
                //                        DispatchQueue(label: "com.load.image1").async {
                //                            if let url = URL(string: Fighter.backdropPath) {
                //                                self?.downloadImage(url: url, completion: { image in
                //                                    guard let image = image else {
                //                                        return
                //                                    }
                //                                    HomeViewModel.cache.setObject(image, forKey: Fighter.idBackdropPath)
                //                                    print(Fighter.idBackdropPath)
                //                                })
                //                            }
                //                        }
                //                    }
                //
                ////                    if Fighter.posterImage == nil {
                ////                        DispatchQueue(label: "com.load.image2").async {
                ////                            if let url = URL(string: Fighter.posterPath) {
                ////                                self?.downloadImage(url: url, completion: { image in
                ////                                    guard let image = image else {
                ////                                        return
                ////                                    }
                ////                                    HomeViewModel.cache.setObject(image, forKey: Fighter.idPosterPath)
                ////                                    print(Fighter.idPosterPath)
                ////                                })
                ////                            }
                ////                        }
                //                    }
                
                fighters.append(fighter)
            }
            self?.delegate?.getFighters(fighters: fighters, error: nil)
        }
    }
    
    
    func downloadImage(url:URL, completion: @escaping (UIImage?) -> Void) {
        if let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            completion(image)
        } else {
            completion(nil)
        }
        
        AF.request(url, method: .get).response { response in
            switch(response.result) {
            case .success(let data):
                guard let data = data else {
                    return
                }
                completion(UIImage(data: data))
            case .failure(let error):
                print(error)
            }
        }
        
        MyNetworking.shared.downloadImage(url: url) { image in
            guard let image = image else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
    
    func getCache(id:NSString ) -> UIImage? {
        return HomeViewModel.cache.object(forKey: id as NSString)
    }
    
    func getUnivers() {
        
        
        self.serviceUniverse.getUniverse(request: UniverserRequest()) {[weak self] response, error in
            if let error = error {
                self?.delegate?.getUniverse(universe: nil, error: error)
                return
            }
            
            guard let response = response else { return }
            self?.delegate?.getUniverse(universe: response, error: error)
        }
    }
}

