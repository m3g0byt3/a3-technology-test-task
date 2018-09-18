//
//  UsersViewController.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

final class UsersViewController: AbstractViewController {

    // MARK: - IBOutlets and UI

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private properties

    private var users = [User]()

    // MARK: - Public properties

    // swiftlint:disable:next implicitly_unwrapped_optional
    var userService: UserServiceProtocol!

    // swiftlint:disable:next implicitly_unwrapped_optional
    var configurator: Configurator<ApplicationAssembly>!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    // MARK: - Public API

    override func setupUI() {
        super.setupUI()
        tableView.register(UserCell.self)
        tableView.tableFooterView = UIView()
    }

    // MARK: - Private API

    private func fetchData() {
        showActivityIndicator(true)
        userService.getUsers { [weak self] result in
            self?.showActivityIndicator(false)
            switch result {

            case .success(let users):
                self?.users = users
                self?.tableView.reloadData()

            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource protocol conformance

extension UsersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
        let user = users[indexPath.row]

        return cell.configure(with: user)
    }
}

// MARK: - UITableViewDelegate protocol conformance

extension UsersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let scene = configurator.getScene(.photos(user: user))

        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(scene.presentableEntity, animated: true)
    }
}
