//
//  HighSchoolDetailViewController.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolDetailViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var highSchoolNameLabel: UILabel!
    @IBOutlet weak var numOfTestTakersLabel: UILabel!
    @IBOutlet weak var totalSATScoreLabel: UILabel!
    @IBOutlet weak var avgMathScoreLabel: UILabel!
    @IBOutlet weak var avgReadingScoreLabel: UILabel!
    @IBOutlet weak var avgWritingScoreLabel: UILabel!
    
    @IBOutlet weak var totalSATScoreProgressBar: UIProgressView!
    @IBOutlet weak var avgMathProgressBar: UIProgressView!
    @IBOutlet var avgReadingScoreProgressBar: UIProgressView!
    @IBOutlet weak var avgWritingScoreProgressBar: UIProgressView!
    
    //MARK:- Variables/Constants
    var satScoreViewModel: HighSchoolSATScoreViewModel?

    //MARK:- Initializer
    init(satScoreViewModel: HighSchoolSATScoreViewModel) {
        self.satScoreViewModel = satScoreViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    //MARK:- Functions
    private func configureView() {
        highSchoolNameLabel.text = satScoreViewModel?.schoolName
        numOfTestTakersLabel.text = "Total Test Takers: \(satScoreViewModel?.numOfTestTakers ?? -1)"
        totalSATScoreLabel.text = "Average SAT Score: \(satScoreViewModel?.totalSATScore ?? -1)"
        avgMathScoreLabel.text = "Math \(satScoreViewModel?.avgMathScore ?? -1)"
        avgReadingScoreLabel.text = "Reading \(satScoreViewModel?.avgCriticalReadingScore ?? -1)"
        avgWritingScoreLabel.text = "Writing \(satScoreViewModel?.avgWritingScore ?? -1)"
        
        // TODO: SAT Score on the progress bar need to be respective to the fac tha the minimum score is 400
        totalSATScoreProgressBar.progress = Float((satScoreViewModel?.totalSATScore ?? 0) / 1200)
        avgMathProgressBar.progress = Float((satScoreViewModel?.avgMathScore ?? 0) / 800)
        avgReadingScoreProgressBar.progress = Float((satScoreViewModel?.avgCriticalReadingScore ?? 0) / 400)
        avgWritingScoreProgressBar.progress = Float((satScoreViewModel?.avgWritingScore ?? 0) / 400)
        
    }
}
