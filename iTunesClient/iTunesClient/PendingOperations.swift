//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Iván Martínez on 16/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
