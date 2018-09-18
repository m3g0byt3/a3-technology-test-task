//
//  ApplicationAssembly.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

/// Container with dependencies, provides data to the service locator.
enum ApplicationAssembly {

    case users(configurator: Configurator<ApplicationAssembly>?)
    case photos(user: User)
}

// MARK: - AssemblyProtocol protocol conformance

extension ApplicationAssembly: AssemblyProtocol {

    var scene: Presentable {
        switch self {

        case .users(let configurator):
            let viewController = UsersViewController.fromNib()
            guard case .users(let userService) = service else {
                fatalError("Unable to resolve dependency ")
            }

            viewController.userService = userService
            viewController.configurator = configurator
            viewController.navigationItem.title = Constants.Strings.usersTitle

            return UINavigationController(rootViewController: viewController)

        case .photos(let user):
            let viewController = PhotosViewController.fromNib()
            guard case .photos(let photosService) = service else {
                fatalError("Unable to resolve dependency ")
            }

            viewController.photosService = photosService
            viewController.user = user
            viewController.navigationItem.title = Constants.Strings.photosTitle

            return viewController
        }
    }

    var service: Service {
        switch self {

        case .users:
            let userProvider = Provider<JSONPlaceholderAPI>(configuration: .shortTimeouts)
            let userService = JSONPlaceholderUserService(provider: userProvider)

            return .users(userService)

        case .photos:
            let photosProvider = Provider<JSONPlaceholderAPI>(configuration: .shortTimeouts)
            let photosService = JSONPlaceholderPhotoService(provider: photosProvider)

            return .photos(photosService)
        }
    }
}
