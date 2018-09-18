//
//  UITableView+Extensions.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    /// Strongly-typed reusable cell dequeueing.
    /// ```
    /// let cell: SomeCustomCell = tableView.dequeueReusableCell(for: indexPath)
    /// ```
    /// - parameter indexPath: The index path specifying the location of the cell.
    /// - returns: Cell instance of type `T`
    /// - throws: ❗️May throw `fatalError` if generic type of cell (`T`) doesn't registered on the `tableView` instance.❗️
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            print("""
                Unable to dequeue cell of type \(T.self).
                Check if cell that conforms to `Reusable` protocol registered
                on the `tableView` instance using `func register(_:)`
                """)
            fatalError("Unable to dequeue cell of type \(T.self)")
        }

        return cell
    }

    /// Register cell that conforms to `Reusable` protocol.
    /// - parameter aReusable: Cell class that conforms to `Reusable` protocol.
    func register(_ aReusable: Reusable.Type) {
        register(aReusable.reusableType, forCellReuseIdentifier: aReusable.reuseIdentifier)
    }
}
