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
    var highSchoolViewModels = [HighSchoolViewModel]()
    var highSchoolsSATScores = [HighSchoolSATScore]()
    var filteredHighSchoolViewModels = [HighSchoolViewModel]()
    var currentlySearching = false
    
    
    
    //MARK:- View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupSearchController()
        setupViewController()
        fetchData()
    }

    //MARK:- Functions
    private func setupViewController() {
        
        view.backgroundColor = AppColors.primaryLiteBlue
        
        // TableView UI
        tableView.backgroundColor = AppColors.primaryDarkBlue
        tableView.register(HighSchoolTableViewCell.self, forCellReuseIdentifier: "highSchoolCell")
        tableView.separatorColor = AppColors.primaryDarkBlue
        tableView.rowHeight = UITableView.automaticDimension
        
        // Navigation Bar
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.backgroundColor = AppColors.primaryLiteBlue
    }
    
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
    
    private func fetchData() {
        HighSchoolDataAPIClient.fetchHighSchools { (results) in
            switch results {
            case .failure(let appError):
                print("Error fetching High School data: \(appError)")
            case .success(let highSchoolsData):
                DispatchQueue.main.async {
                    
                    self.highSchoolViewModels = highSchoolsData.map({return HighSchoolViewModel(highSchool: $0)})
                    self.tableView.reloadData()
                }
                
            }
        }
        
        HighSchoolDataAPIClient.fetchSATScores { (results) in
            switch results {
            case .failure(let appError):
                print("Error fetching SAT Scores: \(appError)")
            case .success(let highSchoolSATScoresData):
                DispatchQueue.main.async {
                    self.highSchoolsSATScores = highSchoolSATScoresData
                }
            }
        }
    }
    
    private func searchHighSchools(_ query: String) {
        filteredHighSchoolViewModels = highSchoolViewModels.filter {
            $0.schoolName.lowercased().contains(query.lowercased())
        }
    }
    //MARK:- @IBActions

}

//MARK:- Extensions

// Tableview Delegate
extension HighSchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var highSchool = highSchoolViewModels[indexPath.row]
        if currentlySearching {
            highSchool = filteredHighSchoolViewModels[indexPath.row]
        }
        guard let satScoreForHighSchool = highSchoolsSATScores.first(where: {$0.dbn == highSchool.dbn }) else {
            showAlert(title: "No SAT Data", message: "Sorry, it appears there is no SAT information for this school")
            return
        }
        if let satScoreDetailViewController = UIStoryboard(name: "HighSchoolDetailView", bundle: nil).instantiateViewController(identifier: "SATScoreDetailView") as? HighSchoolDetailViewController {
            satScoreDetailViewController.satScoreViewModel = HighSchoolSATScoreViewModel(highSchoolSATScore: satScoreForHighSchool)
            if let navigator = navigationController {
                dismiss(animated: true, completion: nil)
                navigator.pushViewController(satScoreDetailViewController, animated: true)
            }
        }
    }
}
// Tableview DataSource
extension HighSchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentlySearching {
            return filteredHighSchoolViewModels.count
        } else {
            return highSchoolViewModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "highSchoolCell", for: indexPath) as? HighSchoolTableViewCell else {
            fatalError("failed to dequeue High School cell")
        }
        var highSchool = highSchoolViewModels[indexPath.row]
        if currentlySearching {
            highSchool = filteredHighSchoolViewModels[indexPath.row]
        }
        cell.highSchoolViewModel = highSchool
        return cell
    }
}

// UISearchController - UISearchResultsUpdating
extension HighSchoolListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text,
              !searchText.isEmpty else {
            currentlySearching = false
            tableView.reloadData()
            return
        }
        currentlySearching = true
        searchHighSchools(searchText)
        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentlySearching = false
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
