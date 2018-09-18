//
//  UIViewController+Extensions.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - Public API

    /// Presents alert with given title and message.
    /// - Parameters:
    ///     - title: Alert title.
    ///     - message: Alert message.
    func presentAlert(title: String, message: String) {
        guard presentedViewController == nil else { return }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: Constants.Strings.alertCloseButtonTitle, style: .default)

        alert.addAction(closeAction)
        present(alert, animated: true)
    }

    /// Initialize instance of type `Self` from NIB.
    static func fromNib() -> Self {
        return _fromNib()
    }

    // MARK: - Private API

    private static func _fromNib<T: UIViewController>() -> T {
        let nibName = String(describing: self)
        guard let viewController = self.init(nibName: nibName, bundle: nil) as? T else {
            fatalError("Unable to init \(self) from NIB file \(nibName)")
        }
        return viewController
    }
}
