//
//  ViewController.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolListViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables/Constants
    var resultSearchController = UISearchController()
    
    
    //MARK:- View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }

    //MARK:- Functions
    private func setupSearchController() {
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.sizeToFit()
            controller.obscuresBackgroundDuringPresentation = false
            controller.automaticallyShowsSearchResultsController = false
            tableView.tableHeaderView = controller.searchBar
            return controller
        })()
    }
    
    //MARK:- @IBActions

}

//MARK:- Extensions
extension HighSchoolListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // Search text gets processed here
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
