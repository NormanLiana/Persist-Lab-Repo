//
//  FavoriteViewController.swift
//  Persist-Lab
//
//  Created by Liana Norman on 10/1/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    // MARK: Properties
    var userFavorites: [FavoritePhoto]! {
        didSet {
            tableViewOutlet.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        loadData()
    }
    
    // MARK: Private Methods
    private func loadData() {
        do {
            userFavorites = try PhotoPersistenceHelper.manager.getPhotos()
        } catch {
            print(error)
        }
    }
    
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFavorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell {
            let favePhoto = userFavorites[indexPath.row]
            cell.favoritesOutlet.text = "Favorites: \(favePhoto.favorites)"
            cell.likesOutlet.text = "Likes: \(favePhoto.likes)"
            cell.tagsOutlet.text = "Tags: \(favePhoto.tags)"
            ImageManager.shared.getImage(imgURL: favePhoto.largeImageURL) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        cell.imgOutlet.image = imageFromOnline
                    }
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
