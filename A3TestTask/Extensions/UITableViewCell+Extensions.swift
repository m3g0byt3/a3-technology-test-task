//
//  UITableViewCell+Extensions.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell: Reusable {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var reusableType: AnyClass {
        return self
    }
}
