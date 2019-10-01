//
//  PhotoPersistenceHelper.swift
//  Persist-Lab
//
//  Created by Liana Norman on 10/1/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PhotoPersistenceHelper {
    static let manager = PhotoPersistenceHelper()
    
    func save(newPhoto: FavoritePhoto) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhotos() throws -> [FavoritePhoto] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<FavoritePhoto>(fileName: "photos.plist")
    
    private init() {}
}
