//
//  Provider.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

struct Provider<T> where T: URLRepresentable {

    // MARK: - Private properties

    private let session: URLSession

    // MARK: - Initialization

    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }

    // MARK: - Public API

    func performRequest<U>(_ type: T,
                           completion: @escaping (Result<U, NetworkError>) -> Void) where U: Codable {
        // Early exit if no internet connection available
        guard Reachability.isConnectedToNetwork() else {
            DispatchQueue.main.async {
                completion(.failure(.connection))
            }
            return
        }

        // Early exit if we are unable to extract URL
        guard let url = type.url else {
            DispatchQueue.main.async {
                completion(.failure(.url))
            }
            return
        }

        // Perform network request
        let range = Constants.Network.successStatusCodeRange
        let task = session.dataTask(with: url) { data, response, error in
            // Handle response
            switch (data, response, error) {

            // Network error (e.g. no internet connection available)
            case (_, _, .some(let error)):
                DispatchQueue.main.async {
                    completion(.failure(.underlying(error)))
                }

            // Backend error (e.g. 404 status code)
            case (_, let response as HTTPURLResponse, _) where !(range ~= response.statusCode):
                DispatchQueue.main.async {
                    completion(.failure(.backend))
                }

            // Successfully receive data from the backend
            case (.some(let data), _, _):
                do {
                    // TODO: Use separate mapper instead of hardcoded `JSONDecoder`
                    let decoder = JSONDecoder()
                    let mapped = try decoder.decode(U.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(mapped))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(.mapping))
                    }
                }

            // Other errors
            default:
                DispatchQueue.main.async {
                    completion(.failure(.unknown))
                }
            }
        }

        task.resume()
    }
}
