//
//  QuerItemProvider.swift
//  iTunesClient
//
//  Created by Iván Martínez on 15/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
