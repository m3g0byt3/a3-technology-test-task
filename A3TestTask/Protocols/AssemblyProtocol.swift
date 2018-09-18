//
//  AssemblyProtocol.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

enum Service {

    case users(UserServiceProtocol)
    case photos(PhotosServiceProtocol)
}

/// Container with dependencies, provides data to the service locator.
protocol AssemblyProtocol {

    /// Scene dependency.
    var scene: Presentable { get }

    /// Service dependency.
    var service: Service { get }
}
