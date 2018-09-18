//
//  UserCell.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import UIKit

final class UserCell: UITableViewCell {

    // MARK: - Public API

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
    }
}

// MARK: - Configurable protocol conformance

extension UserCell: Configurable {

    typealias Model = User

    @discardableResult
    func configure(with model: Model) -> Self {
        textLabel?.text = model.name

        return self
    }
}
