//
//  CategoryFighterCollectionViewCell.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 19/01/22.
//

import UIKit

class CategoryFighterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryButton: UIButton!
    
    var fighter: Fighter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryButton.titleLabel?.text = ""
    }
    
    func setup(fighter: Fighter) {
        categoryButton.titleLabel?.text = fighter.universe
    }
    
    @IBAction func CategoryButtonPressed(_ sender: UIButton) {
        
    }
    
}
