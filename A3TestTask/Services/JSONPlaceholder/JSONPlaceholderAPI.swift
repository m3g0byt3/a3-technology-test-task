//
//  JSONPlaceholderAPI.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

enum JSONPlaceholderAPI {

    case getUsers
    case getPhotos(user: User, page: Int)
}

// MARK: - APIProtocol protocol conformance

extension JSONPlaceholderAPI: APIProtocol {

    var scheme: String {
        return "https"
    }

    var base: String {
        return "jsonplaceholder.typicode.com"
    }

    var path: String {
        switch self {

        case .getUsers:
            return "users"

        case .getPhotos:
            return "albums"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {

        case .getUsers:
            return []

        case let .getPhotos(user, page):
            let userID = URLQueryItem(name: "userId", value: "\(user.identifier)")
            let embed = URLQueryItem(name: "_embed", value: "photos")
            let start = URLQueryItem(name: "_start", value: "\(page)")
            let limit = URLQueryItem(name: "_limit", value: "\(Constants.Network.pageAlbumLimit)")
            return [userID, embed, start, limit]
        }
    }
}

// MARK: - URLRepresentable protocol conformance

extension JSONPlaceholderAPI: URLRepresentable {}
