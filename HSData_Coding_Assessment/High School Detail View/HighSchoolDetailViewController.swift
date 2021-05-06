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
    
    @IBOutlet weak var mathProgressBar: CustomProgressBar!
    @IBOutlet weak var readingProgressBar: CustomProgressBar!
    @IBOutlet weak var writingProgressBar: CustomProgressBar!
    
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
        
        // Total SAT Score based on a Max total of 1600
        totalSATScoreProgressBar.progress = Float(Double(satScoreViewModel?.totalSATScore ?? 0) / 1600)
        
        // Math score can be from 200 - 800, for a range of 600
        mathProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgMathScore ?? 0) / 600)
        
        // Reading and writing combined have a max of 800, and similar to 800
        readingProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgCriticalReadingScore ?? 0) / 500)
        writingProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgWritingScore ?? 0) / 500)
    }
}
