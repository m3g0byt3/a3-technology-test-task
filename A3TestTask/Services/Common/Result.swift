//
//  Result.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

enum Result<T, E> where E: Error {

    case success(T)
    case failure(E)
}
