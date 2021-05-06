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
    
    //MARK:- @IBActions

}

//MARK:- Extensions

// Tableview Delegate
extension HighSchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let highSchool = highSchoolViewModels[indexPath.row]
        guard let satScoreForHighSchool = highSchoolsSATScores.first(where: {$0.dbn == highSchool.dbn }) else {
            print("dbn not found")
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
        return highSchoolViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "highSchoolCell", for: indexPath) as? HighSchoolTableViewCell else {
            fatalError("failed to dequeue High School cell")
        }
        let highSchool = highSchoolViewModels[indexPath.row]
        cell.highSchoolViewModel = highSchool
        return cell
    }
}

// UISearchController - UISearchResultsUpdating
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
