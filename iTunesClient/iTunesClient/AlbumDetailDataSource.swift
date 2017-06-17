//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Iván Martínez on 13/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    private var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    // MARK: - DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier, for: indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let songViewModel = SongViewModel(song: song)
        
        cell.songTitleLabel.text = songViewModel.title
        cell.songRuntimeLabel.text = songViewModel.runtime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tracks"
        default:
            return nil
        }
    }
    
    // MARK: - Helper
    
    func update(with songs: [Song]) {
        self.songs = songs
    }
}
