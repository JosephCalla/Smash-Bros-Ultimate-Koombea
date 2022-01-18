//
//  OnboardingView.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol OnboardingViewProtocol {
    func viewWillPresent(data: Onboarding)
}

class OnboardingView: UIViewController, OnboardingViewProtocol {
    
    private var ui = OnboardingUI()
    var viewModel : OnboardingViewModel! {
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
    
    func viewWillPresent(data: Onboarding) {
        ui.object = data
    }
}

extension OnboardingView : OnboardingUIDelegate {
    func uiDidSelect(object: Onboarding) {
        viewModel.didReceiveUISelect(object: object)
    }
}
