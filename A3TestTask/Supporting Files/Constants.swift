//
//  Constants.swift
//  A3TestTask
//
//  Created by m3g0byt3 on 18/09/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import Foundation

enum Constants {

    enum Strings {
        static let usersTitle = "Users"
        static let photosTitle = "Photos"
        static let alertCloseButtonTitle = "OK"
        static let errorTitle = "Error"
        static let errorMessage = "An error has occurred:\n"
    }

    enum Network {
        static let pageAlbumLimit = 1
        static var successStatusCodeRange = 200..<300
        static let requestTimeout: TimeInterval = 15.0
        static let resourceTimeout: TimeInterval = 15.0
    }
}
