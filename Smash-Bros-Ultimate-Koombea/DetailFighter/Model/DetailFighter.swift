//
//  DetailFighter.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

/// DetailFighter Model
struct  DetailFighter {
    typealias didFetchSuccess = (DetailFighter)->()
    typealias didFailWithError = (Error?) -> ()
    
    // Your Model Structure
    var id : Int?
    var name : Int?
    
    func didFetch(withSuccess: @escaping didFetchSuccess, withError: @escaping didFailWithError) {
        withSuccess(DetailFighter())
        withError(nil)
    }
}
