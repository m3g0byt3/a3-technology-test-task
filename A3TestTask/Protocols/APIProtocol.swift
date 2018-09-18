//
//  APIProtocol.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

protocol APIProtocol {

    var scheme: String { get }
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}
