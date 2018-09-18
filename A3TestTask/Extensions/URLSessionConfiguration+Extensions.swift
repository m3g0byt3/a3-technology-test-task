//
//  URLSessionConfiguration+Extensions.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

extension URLSessionConfiguration {

    static let shortTimeouts: URLSessionConfiguration = { this in
        this.timeoutIntervalForRequest = Constants.Network.requestTimeout
        this.timeoutIntervalForResource = Constants.Network.resourceTimeout
        return this
    }(URLSessionConfiguration.default)
}
