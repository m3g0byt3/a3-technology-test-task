//
//  JSONPlaceholderUserService.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

struct JSONPlaceholderUserService {

    // MARK: - Private properties

    private let provider: Provider<JSONPlaceholderAPI>

    // MARK: - Initialization

    init(provider: Provider<JSONPlaceholderAPI>) {
        self.provider = provider
    }
}

// MARK: - UserServiceProtocol protocol conformance

extension JSONPlaceholderUserService: UserServiceProtocol {

    func getUsers(_ completion: @escaping UserServiceProtocol.Completion) {
        provider.performRequest(.getUsers, completion: completion)
    }
}
