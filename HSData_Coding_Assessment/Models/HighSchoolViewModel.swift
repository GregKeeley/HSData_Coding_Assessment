//
//  HighSchoolViewModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolViewModel {
    
    let schoolName: String
    let avgMathScore: Int, avgCriticalReadingScore: Int, avgWritingScore: Int, avgTotalSATScore: Int
    
    init(highSchool: HighSchool, SATScore: HighSchoolSATScore) {
        
        schoolName = highSchool.school_name ?? "No name available"
        avgMathScore = Int(SATScore.sat_math_avg_score) ?? -1
        avgCriticalReadingScore = Int(SATScore.sat_critical_reading_avg_score) ?? -1
        avgWritingScore = Int(SATScore.sat_writing_avg_score) ?? -1
        avgTotalSATScore = (avgMathScore + avgCriticalReadingScore + avgWritingScore)
        
    }

}
