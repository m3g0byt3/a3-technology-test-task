//
//  PhotoCell.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

final class PhotoCell: UITableViewCell {

    // MARK: - Public API

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.text = nil
        // TODO: Reset image and cancel download
    }
}

// MARK: - Configurable protocol conformance

extension PhotoCell: Configurable {

    typealias Model = Photo

    @discardableResult
    func configure(with model: Model) -> Self {
        textLabel?.text = model.title
        // TODO: Load image from url
        return self
    }
}
