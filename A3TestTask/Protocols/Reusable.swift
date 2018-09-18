//
//  Reusable.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

/// Easy management for reusable cells.
protocol Reusable {

    /// Reuse identifier of the cell class.
    static var reuseIdentifier: String { get }

    /// Cell class itself.
    static var reusableType: AnyClass { get }
}
