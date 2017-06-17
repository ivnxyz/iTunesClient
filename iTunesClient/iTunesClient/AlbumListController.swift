//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Iván Martínez on 12/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    lazy var dataSource: AlbumListDataSource =  {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()
    
    let client = ItunesAPIClient()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                let albumDetailController = segue.destination as! AlbumDetailController
                
                client.lookupAlbum(withId: selectedAlbum.id, completion: { album, error in
                    guard let album = album else { return }
                    
                    album.artwork = selectedAlbum.artwork
                    albumDetailController.album = album
                })
            }
        }
    }
}
