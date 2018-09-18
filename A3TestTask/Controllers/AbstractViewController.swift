//
//  AbstractViewController.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {

    // MARK: - IBOutlets and UI

    private lazy var indicatorButton: UIBarButtonItem = {
        let indicator = UIActivityIndicatorView(style: .gray)
        activityIndicator = indicator
        return UIBarButtonItem(customView: indicator)
    }()

    private weak var activityIndicator: UIActivityIndicatorView?

    // MARK: - Public API

    func setupUI() {
        navigationItem.setRightBarButton(indicatorButton, animated: true)
        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    func handleError(_ error: Error) {
        let title = Constants.Strings.errorTitle
        let message = Constants.Strings.errorMessage + error.localizedDescription
        presentAlert(title: title, message: message)
    }

    func showActivityIndicator(_ show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
        _ = show ? activityIndicator?.startAnimating() : activityIndicator?.stopAnimating()
    }

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        type(of: self).checkInitOverride()
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        type(of: self).checkInitOverride()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    init() {
        type(of: self).checkInitOverride()
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Private API

    /// Avoid initialization of abstract class
    private static func checkInitOverride() {
        if type(of: self) == AbstractViewController.self {
            fatalError("Create a subclass instance of abstract class \(AbstractViewController.self).")
        }
    }
}
