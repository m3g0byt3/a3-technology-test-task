//
//  NetworkError.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

enum NetworkError: Error {

    case underlying(Error)
    case url
    case connection
    case mapping
    case backend
    case unknown
}

// MARK: - LocalizedError protocol conformance

extension NetworkError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .underlying(let error): return error.localizedDescription
        case .url: return "Unable to construct URL."
        case .connection: return "No internet connection available."
        case .mapping: return "Unable to parse data from server."
        case .backend: return "Unable to get data from server."
        case .unknown: return "An unknown error occurred."
        }
    }
}
