//
//  FighterTableViewCell.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 19/01/22.
//

import UIKit

class FighterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var fighterImage: UIImageView!
    
    var fighter: Fighter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(fighter: Fighter) {
        if let url = URL(string: fighter.fighterIimageURL!) {
            downloadImage(url: url) { image in
                DispatchQueue.main.async {
                    self.fighterImage.image = image
                }
            }
        }
        self.fighter = fighter
        setup(fighter: fighter)
    }
    
    func setup(fighter: Fighter) {
        self.titleLabel.text = fighter.title
        self.descriptionLabel.text = fighter.universe
        self.priceLabel.text = "Price: \(fighter.price)"
        self.downloadLabel.text = "Downloads: \(fighter.download)"
        self.rateLabel.text = "Rate: \(fighter.rate)"
    }
    
    func downloadImage(url:URL, completion: @escaping (UIImage?) -> Void) {
        MyNetworking.shared.downloadImage(url: url) {[weak self] image in
            guard let image = image else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}


