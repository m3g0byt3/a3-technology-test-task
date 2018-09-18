//
//  JSONPlaceholderPhotoService.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

struct JSONPlaceholderPhotoService {

    // MARK: - Private properties

    private let provider: Provider<JSONPlaceholderAPI>

    // MARK: - Initialization

    init(provider: Provider<JSONPlaceholderAPI>) {
        self.provider = provider
    }
}

// MARK: - PhotosServiceProtocol protocol conformance

extension JSONPlaceholderPhotoService: PhotosServiceProtocol {

    func getPhotos(user: User, page: Int, completion: @escaping PhotosServiceProtocol.Completion) {
        provider.performRequest(.getPhotos(user: user, page: page)) { (result: Result<[Album], NetworkError>) in
            switch result {
            case .success(let albums):
                // TODO: Implement custom `init(from:)` in `Photos` model instead of temp. mapping to the `Album` model.
                let photos = albums.flatMap { $0.photos }
                completion(.success(photos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
