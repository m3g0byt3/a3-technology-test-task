//
//  URLRepresentable.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

protocol URLRepresentable {

    var url: URL? { get }
}

extension URLRepresentable where Self: APIProtocol {

    var url: URL? {
        var components = URLComponents()

        components.scheme = scheme
        components.host = base
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}
