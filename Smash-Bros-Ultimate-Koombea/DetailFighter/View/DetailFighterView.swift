//
//  DetailFighterView.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol DetailFighterViewProtocol {
    func viewWillPresent(data: DetailFighter)
}

class DetailFighterView: UIViewController, DetailFighterViewProtocol {
    
    private var ui = DetailFighterUI()
    var viewModel : DetailFighterViewModel! {
        willSet {
            newValue.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData()
    }
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(data: DetailFighter) {
        ui.object = data
    }
}

extension DetailFighterView : DetailFighterUIDelegate {
    func uiDidSelect(object: DetailFighter) {
        viewModel.didReceiveUISelect(object: object)
    }
}
