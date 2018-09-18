//
//  PhotosViewController.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

final class PhotosViewController: UIViewController {

    // MARK: - Public properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    var user: User!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var photosService: PhotosServiceProtocol!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Private API

    private func fetchData() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // TODO: change page number in request
        photosService.getPhotos(user: user, page: 0) { [weak self] result in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let photos):
                print(photos)
            case .failure(let error):
                let title = Constants.Strings.errorTitle
                let message = Constants.Strings.errorMessage + error.localizedDescription
                self?.presentAlert(title: title, message: message)
            }
        }
    }
}
