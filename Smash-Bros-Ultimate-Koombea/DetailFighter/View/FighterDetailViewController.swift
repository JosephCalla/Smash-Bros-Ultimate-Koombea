//
//  FighterDetailViewController.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import UIKit

class FighterDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var fighterImageView: UIImageView!
    
    var fighter: Fighter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fighter = fighter else { return }
        self.titleLabel.text = fighter.title
        self.subtitleLabel.text = fighter.universe
        self.descriptionTextView.text = fighter.description
        self.priceLabel.text = fighter.price
        DispatchQueue.main.async {
            self.fighterImageView.image = fighter.fighterImage
        }
    }
}


