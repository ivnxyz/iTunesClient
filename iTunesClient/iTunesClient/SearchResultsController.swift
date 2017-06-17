//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Iván Martínez on 12/06/17.
//  Copyright © 2017 Iván Martínez. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissResultsController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = dataSource
        definesPresentationContext = true
    }

    func dismissResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                let albumListController = segue.destination as! AlbumListController
                
                client.lookupArtist(withId: artist.id, completion: { artist, error in
                    albumListController.artist = artist
                })
            }
        }
    }

}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        client.searchForArtists(withTerm: searchController.searchBar.text!) { [weak self] artists, error in
            
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: "AN ERROR!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(action)
                
                self?.present(alertController, animated: true, completion: nil)
                
                print(error!.localizedDescription)
            }
            
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
}
