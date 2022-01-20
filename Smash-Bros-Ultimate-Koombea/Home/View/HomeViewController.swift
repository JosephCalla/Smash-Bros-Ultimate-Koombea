//
//  HomeViewController.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 19/01/22.
//

import UIKit
protocol HomeViewControllerDelegate: class {
    func isSelected(fighter: Fighter)
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterBarButton: UIBarButtonItem!
    
    var viewModel: HomeViewModelProtocol = HomeViewModel(service: FighterService())
    
    var fighter:[Fighter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        registerCell()
        self.viewModel.getFighters()
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
    
    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
    }
    
    // MARK: UI

    func registerCell() {
        tableView.register(UINib(nibName: "FighterTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "fighterCell")
        collectionView.register(UINib(nibName: "CategoryFighterCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "categoryFighterCell")
    }
    
    func getImages(fighters:[Fighter]) -> [Fighter] {
        var fightersWithImage: [Fighter] = fighters
        for (index,fighter) in fighters.enumerated() {
            
            if fighter.fighterImage == nil {
                fightersWithImage[index].fighterImage = self.viewModel.getCache(id: fightersWithImage[index].objectID as NSString)
            }
        }
        return fightersWithImage
    }
    
    
    // MARK: ACTION
    
    @IBAction func filterBarButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}
// MARK: UITableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fighter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fighterCell", for: indexPath) as! FighterTableViewCell
        if fighter.count > 1 {
            cell.fighter = fighter[indexPath.row]
        }
        
        if let fighter = cell.fighter { cell.configure(fighter: fighter)}

        return cell
    }
}

// MARK: UICollectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fighter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryFighterCell",
                                                      for: indexPath) as? CategoryFighterCollectionViewCell
        if fighter.count > 1 {
            cell?.categoryButton.titleLabel?.text = fighter[indexPath.row].universe
        }
        return cell!
    }
    // MARK: Fighter Detail

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detail = UIStoryboard.init(name: "FighterDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "detail") as? FighterDetailViewController else { return }
//            let detailFighter = FighterDetail(title: fighter[indexPath.row].title,
//                                              subtitle: fighter[indexPath.row].universe,
//                                              descriptionT: fighter[indexPath.row].description,
//                                              price: fighter[indexPath.row].price)
//
        detail.fighter = fighter[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

// MARK: HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func getFighters(fighters: [Fighter]?, error: Error?) {
        guard let fighters = fighters, fighters.count > 0 else { return }
        let fighterWithImages = getImages(fighters: fighters)
        self.fighter = fighterWithImages
        tableView.reloadData()
        collectionView.reloadData()
    }
}
