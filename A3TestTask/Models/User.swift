//
//  User.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

struct User: Codable {

    // MARK: - Properties

    let identifier: Int
    let name: String

    // MARK: - Codable protocol conformance

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
}
