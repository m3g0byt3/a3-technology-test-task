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

    // MARK: - IBOutlets and UI

    @IBOutlet private weak var photoImageContainerView: UIView!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var photoTitleLabel: UILabel!

    // MARK: - Public API

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.cancel()
        photoImageView.image = nil
        photoTitleLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    // MARK: - Private API

    private func setupUI() {
        let ratio = Constants.Interface.cornerRadiusToWidthRatio
        let cornerRadius = photoImageContainerView.frame.width * ratio

        photoImageView.layer.cornerRadius = cornerRadius
        photoImageView.clipsToBounds = true

        // TODO: Set `shadowPath` after first layout cycle for better performance
        photoImageContainerView.layer.masksToBounds = false
        photoImageContainerView.layer.cornerRadius = cornerRadius
        photoImageContainerView.layer.shadowColor = Constants.Interface.shadowColor
        photoImageContainerView.layer.shadowOffset = Constants.Interface.shadowOffset
        photoImageContainerView.layer.shadowOpacity = Constants.Interface.shadowOpacity
        photoImageContainerView.layer.shadowRadius = Constants.Interface.shadowRadius
    }
}

// MARK: - Configurable protocol conformance

extension PhotoCell: Configurable {

    typealias Model = Photo

    @discardableResult
    func configure(with model: Model) -> Self {
        photoTitleLabel.text = model.title
        photoImageView.load(with: model.url)

        return self
    }
}
