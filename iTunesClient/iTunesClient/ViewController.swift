//
//  ViewController.swift
//  iTunesClient
//
//  Created by Iván Martínez on 08/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let searchEndpoint = Itunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        print(searchEndpoint.request)
        
        print("**************")
        
        let lookupEndpoint = Itunes.lookup(id: Stub.artist.id, entity: MusicEntity.album)
        print(lookupEndpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

