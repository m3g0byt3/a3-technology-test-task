//
//  Presentable.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

/// Represents entity to present (e.g. `UIViewController`).
protocol Presentable {

    /// Entity to present.
    var presentableEntity: UIViewController { get }
}

extension Presentable where Self: UIViewController {

    var presentableEntity: UIViewController { return self }
}
