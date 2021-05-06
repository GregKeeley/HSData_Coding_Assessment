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
    
    //MARK:- View Life Cycles
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //MARK:- Functions
    private func configureView() {
        highSchoolNameLabel.text = satScoreViewModel?.schoolName
        highSchoolNameLabel.tintColor = AppColors.primaryDarkBlue
        numOfTestTakersLabel.text = "Total Test Takers: \(satScoreViewModel?.numOfTestTakers ?? -1)"
        totalSATScoreLabel.text = "\(satScoreViewModel?.totalSATScore ?? -1)"
        avgMathScoreLabel.text = "\(satScoreViewModel?.avgMathScore ?? -1)"
        avgReadingScoreLabel.text = "\(satScoreViewModel?.avgCriticalReadingScore ?? -1)"
        avgWritingScoreLabel.text = "\(satScoreViewModel?.avgWritingScore ?? -1)"
        
        // Note: SAT Scoring and ranges based on the calculator found here: https://www.albert.io/blog/sat-score-calculator/
        // TODO: Make a better calculation for the progress bar to more accurately reflect the score for each subject
        totalSATScoreProgressBar.tintColor = AppColors.primaryDarkBlue
        totalSATScoreProgressBar.progress = Float(Double(satScoreViewModel?.totalSATScore ?? 0) / 1600)
        
        
        mathProgressBar.gradientColors = [AppColors.primaryGreen.cgColor, AppColors.primaryGreen.cgColor]
        mathProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgMathScore ?? 0) / 600)
        
        
        readingProgressBar.gradientColors = [AppColors.primaryOrange.cgColor, AppColors.primaryOrange.cgColor]
        readingProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgCriticalReadingScore ?? 0) / 500)
        writingProgressBar.gradientColors = [AppColors.primaryLiteBlue.cgColor, AppColors.primaryLiteBlue.cgColor]
        writingProgressBar.progress = CGFloat(Double(satScoreViewModel?.avgWritingScore ?? 0) / 500)
    }
}
