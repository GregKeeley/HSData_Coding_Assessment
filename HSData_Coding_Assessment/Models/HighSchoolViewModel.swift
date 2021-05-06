//
//  HighSchoolViewModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolViewModel {
    
    let schoolName: String, neighborhood: String
//    let avgMathScore: Int, avgCriticalReadingScore: Int, avgWritingScore: Int, avgTotalSATScore: Int
    
    init(highSchool: HighSchool) {
        
        self.schoolName = highSchool.school_name ?? "No name available"
        self.neighborhood = highSchool.neighborhood ?? "No neighborhood available"
        
//        self.avgMathScore = Int(SATScore.sat_math_avg_score) ?? -1
//        self.avgCriticalReadingScore = Int(SATScore.sat_critical_reading_avg_score) ?? -1
//        self.avgWritingScore = Int(SATScore.sat_writing_avg_score) ?? -1
//        self.avgTotalSATScore = (avgMathScore + avgCriticalReadingScore + avgWritingScore)
        
    }

}
