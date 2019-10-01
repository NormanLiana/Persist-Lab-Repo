//
//  PhotosViewController.swift
//  Persist-Lab
//
//  Created by Liana Norman on 9/30/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    // MARK: Properties
    var photos = [Photos]() {
        didSet {
            tableViewOutlet.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        searchBarOutlet.delegate = self
    }
    
    // MARK: Private Methods
    private func loadData(search: String) {
        PhotosAPIManager.shared.getPhotos(searchTerm: search) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photosFromOnline):
                self.photos = photosFromOnline
            }
        }
    }

}

// MARK: Extensions
extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as? PhotosTableViewCell {
            let photo = photos[indexPath.row]
            ImageManager.shared.getImage(imgURL: photo.largeImageURL) { (result) in
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

extension PhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
}

extension PhotosViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadData(search: searchBar.text ?? "")
    }
}
