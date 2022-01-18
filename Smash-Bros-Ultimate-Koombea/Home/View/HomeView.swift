//
//  HomeView.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol HomeViewProtocol {
    func viewWillPresent(data: Home)
}

class HomeView: UIViewController, HomeViewProtocol {
    
    private var ui = HomeUI()
    var viewModel : HomeViewModel? {
        willSet {
            newValue?.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel?.fetchData()
    }
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(data: Home) {
        ui.object = data
    }
}

extension HomeView : HomeUIDelegate {
    func uiDidSelect(object: Home) {
        viewModel?.didReceiveUISelect(object: object)
    }
}
