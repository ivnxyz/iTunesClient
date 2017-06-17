//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Iván Martínez on 15/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
