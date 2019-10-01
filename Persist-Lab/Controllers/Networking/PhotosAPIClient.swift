//
//  PhotosAPIClient.swift
//  Persist-Lab
//
//  Created by Liana Norman on 9/30/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class PhotosAPIManager {
    private init() {}
    
    static let shared = PhotosAPIManager()
    
    func getPhotos(searchTerm: String, completionHandler: @escaping (Result<[Photos], AppError>) -> () ) {
        let urlStr = "https://pixabay.com/api/?key=\(Secret.apiKey)&q=\(searchTerm.replacingOccurrences(of: " ", with: "+"))"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let photosInfo = try JSONDecoder().decode(PhotosWrapper.self, from: data)
                    
                    completionHandler(.success(photosInfo.hits))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
}
