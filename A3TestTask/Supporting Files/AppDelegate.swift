//
//  AppDelegate.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    var configurator: Configurator<ApplicationAssembly>?

    // MARK: - UIApplicationDelegate protocol conformance

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        injectDependencies()
        return true
    }

    // MARK: - Private API

    private func injectDependencies() {
        configurator = Configurator<ApplicationAssembly>()
        window = UIWindow(frame: UIScreen.main.bounds)

        let scene = configurator?.getScene(.users(configurator: configurator))

        window?.rootViewController = scene?.presentableEntity
        window?.makeKeyAndVisible()
    }
}
