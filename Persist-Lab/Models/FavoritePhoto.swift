//
//  FavoritePhoto.swift
//  Persist-Lab
//
//  Created by Liana Norman on 10/1/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct FavoritePhoto: Codable {
    let likes: Int
    let favorites: Int
    let tags: String
    let largeImageURL: String
}
