//
//  PhotosModel.swift
//  Persist-Lab
//
//  Created by Liana Norman on 9/30/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PhotosWrapper: Codable {
    let hits: [Photos]
}

struct Photos: Codable {
    let largeImageURL: String
    let likes: Int
    let favorites: Int
    let tags: String
    let previewURL: String
    let webformatURL: String
}

//{
//    "totalHits": 500,
//    "hits": [
//    {
//    "largeImageURL": "https://pixabay.com/get/52e5d54b4e56a814f6da8c7dda79367d1236d8e05b556c48702972dc904dc459bc_1280.jpg",
//    "webformatHeight": 426,
//    "webformatWidth": 640,
//    "likes": 65,
//    "imageWidth": 7087,
//    "id": 4508444,
//    "user_id": 3764790,
//    "views": 3136,
//    "comments": 42,
//    "pageURL": "https://pixabay.com/photos/landscape-ice-aurora-borealis-cold-4508444/",
//    "imageHeight": 4724,
//    "webformatURL": "https://pixabay.com/get/52e5d54b4e56a814f6da8c7dda79367d1236d8e05b556c48702972dc904dc459bc_640.jpg",
//    "type": "photo",
//    "previewHeight": 99,
//    "tags": "landscape, ice, aurora borealis",
//    "downloads": 2022,
//    "user": "enriquelopezgarre",
//    "favorites": 32,
//    "imageSize": 9108367,
//    "previewWidth": 150,
//    "userImageURL": "https://cdn.pixabay.com/user/2019/07/31/16-48-20-476_250x250.jpg",
//    "previewURL": "https://cdn.pixabay.com/photo/2019/09/27/12/39/landscape-4508444_150.jpg"
//    },
