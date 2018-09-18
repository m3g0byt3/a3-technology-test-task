//
//  NIBRepresentable.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation
import UIKit

/// Easy management for reusable cells with NIBs.
protocol NIBRepresentable: Reusable {

    /// NIB for cell class.
    static var nib: UINib? { get }
}
