//
//  HighSchoolSATScoreViewModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import Foundation

struct HighSchoolSATScoreViewModel {
    
    let schoolName: String, dbn: String
    let avgMathScore: Int, avgCriticalReadingScore: Int, avgWritingScore: Int, numOfTestTakers: Int
    let totalSATScore: Int
    
    init(highSchoolSATScore: HighSchoolSATScore) {
        
        self.schoolName = highSchoolSATScore.schoolName
        self.dbn = highSchoolSATScore.dbn
        self.avgMathScore = Int(highSchoolSATScore.avgMathScore) ?? -1
        self.avgCriticalReadingScore = Int(highSchoolSATScore.avgCriticalReadingScore) ?? -1
        self.avgWritingScore = Int(highSchoolSATScore.avgWritingScore) ?? -1
        self.numOfTestTakers = Int(highSchoolSATScore.numOfSATTestTakers) ?? -1
        
        self.totalSATScore = (avgWritingScore + avgMathScore + avgCriticalReadingScore)
        
    }
}
