//
//  PhotosDetailViewController.swift
//  Persist-Lab
//
//  Created by Liana Norman on 10/1/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var likesOutlet: UILabel!
    @IBOutlet weak var favoritesOultet: UILabel!
    @IBOutlet weak var tagsOutlet: UILabel!
    
    // MARK: Properties
    var photo: Photos!
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // Private Methods
    private func setUpViews() {
        likesOutlet.text = "Likes: \(photo.likes)"
        favoritesOultet.text = "Favorites: \(photo.favorites)"
        tagsOutlet.text = "Tags: \(photo.tags)"
        loadImage()
    }
    
    private func loadImage() {
        ImageManager.shared.getImage(imgURL: photo.largeImageURL) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    self.imageOutlet.image = imageFromOnline
                    
                }
            }
        }
    }
}
