//
//  HighSchoolDetailViewController.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolDetailViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    //MARK:- Variables/Constants
    var highSchoolSATScoreViewModel: HighSchoolSATScoreViewModel?

    init(satScoreViewModel: HighSchoolSATScoreViewModel) {
        self.highSchoolSATScoreViewModel = satScoreViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    



}
