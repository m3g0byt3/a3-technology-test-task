//
//  PhotosServiceProtocol.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

protocol PhotosServiceProtocol {

        // MARK: - Typealiases

        typealias Completion = (Result<[Photo], NetworkError>) -> Void

        // MARK: - Protocol requirements

        func getPhotos(user: User, page: Int, completion: @escaping Completion)
}
