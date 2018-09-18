//
//  UserServiceProtocol.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {

    // MARK: - Typealiases

    typealias Completion = (Result<[User], NetworkError>) -> Void

    // MARK: - Protocol requirements

    func getUsers(_ completion: @escaping Completion)
}
