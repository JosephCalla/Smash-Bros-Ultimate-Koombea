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

protocol HomeViewModelProtocol {
    func fetchData()
    func didReceiveUISelect(object: Home)
}

class HomeViewModel {
    var view : HomeViewProtocol!
    var object = Home()
    
    func fetchData() {
        object.didFetch(withSuccess: { (success) in
            self.view.viewWillPresent(data: success)
        }) { (err) in
            debugPrint("Error happened", err as Any)
        }
    }
    
    func didReceiveUISelect(object: Home) {
        debugPrint("Did receive UI object", object)
    }
}
