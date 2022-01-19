//
//  OnboardingView.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created Joseph Estanislao Calla Moreyra on 18/01/22.


import UIKit

protocol OnboardingViewProtocol {
//    func viewWillPresent(data: Onboarding)
}

class OnboardingView: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    var slides: [OnboardingSlide] = []
    
//    var viewModel : OnboardingViewModel! {
//        willSet {
//            newValue.view = self
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onboardingCollectionView?.delegate = self
        self.onboardingCollectionView?.dataSource = self
        
        slides = [OnboardingSlide(title: "Access our Extented Catalog",
                                  image: UIImage(named: "fighter-1")!),
                  OnboardingSlide(title: "Filter Universes",
                                  image: UIImage(named: "fighter-2")!),
                  OnboardingSlide(title: "And More",
                                  image: UIImage(named: "fighter-3")!)]
        
//        viewModel.fetchData()
    }
}

extension OnboardingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
}
