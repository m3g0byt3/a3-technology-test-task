//
//  UIImageView+Extensions.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC.runtime

private var taskKey: Void?

extension UIImageView {

    // MARK: - Private API

    private static let cache = NSCache<NSString, UIImage>()

    private var currentDownloadTask: URLSessionTask? {
        get {
            return objc_getAssociatedObject(self, &taskKey) as? URLSessionTask
        }
        set {
            objc_setAssociatedObject(self, &taskKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private var activityIndicator: UIActivityIndicatorView? {
        // Early exit if `UIActivityIndicatorView` instance already added
        if let indicator = subviews.map({ $0 as? UIActivityIndicatorView }).first {
            return indicator
        }

        // Create and add `UIActivityIndicatorView` instance to subviews
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)

        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        return indicator
    }

    // MARK: - Public API

    func load(with url: URL) {
        if let cached = UIImageView.cache.object(forKey: url.absoluteString as NSString) {
            image = cached
        } else {
            activityIndicator?.startAnimating()
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                // TODO: Add error handling
                if let image = data.flatMap(UIImage.init) {
                    DispatchQueue.main.async {
                        UIImageView.cache.setObject(image, forKey: url.absoluteString as NSString)
                        self?.image = image
                        self?.setNeedsLayout()
                    }
                }
                DispatchQueue.main.async {
                    self?.activityIndicator?.stopAnimating()
                }
            }

            currentDownloadTask = task
            task.resume()
        }
    }

    func cancel() {
        currentDownloadTask?.cancel()
        activityIndicator?.stopAnimating()
    }
}
