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

    // MARK: - IBOutlets and UI

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private properties

    private var photos = [Photo]()
    private var currentPage = 0

    // MARK: - Public properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    var user: User!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var photosService: PhotosServiceProtocol!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData(for: currentPage)
    }

    // MARK: - Private API

    private func setupUI() {
        tableView.tableFooterView = UIView()
        tableView.register(PhotoCell.self)
        tableView.estimatedRowHeight = view.frame.width
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func fetchData(for page: Int) {
        showActivityIndicator(true)
        photosService.getPhotos(user: user, page: page) { [weak self] result in
            self?.showActivityIndicator(false)
            switch result {
            case .success(let photos):
                self?.photos.append(contentsOf: photos)
                self?.tableView.reloadData()
            case .failure(let error):
                let title = Constants.Strings.errorTitle
                let message = Constants.Strings.errorMessage + error.localizedDescription
                self?.presentAlert(title: title, message: message)
            }
        }
    }

    private func showActivityIndicator(_ show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
        if !show {
            tableView.flashScrollIndicators()
        }
    }
}

// MARK: - UITableViewDataSource protocol conformance

extension PhotosViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoCell = tableView.dequeueReusableCell(for: indexPath)
        let photo = photos[indexPath.row]

        return cell.configure(with: photo)
    }
}
