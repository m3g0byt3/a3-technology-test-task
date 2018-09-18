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

    // MARK: - UIApplicationDelegate protocol conformance

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        injectDependencies()
        return true
    }

    // MARK: - Private API

    // TODO: Inject dependencies using DI assembly or service locator
    private func injectDependencies() {
        let listViewController = ListViewController.fromNib()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: listViewController)
        window?.makeKeyAndVisible()
    }
}