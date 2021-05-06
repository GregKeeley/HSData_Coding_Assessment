//
//  SATScoreModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import Foundation

class HighSchoolSATScore: Decodable {
    
    let dbn: String, numOfSATTestTakers: String, schoolName: String, avgCriticalReadingScore: String, avgMathScore: String, avgWritingScore: String
    
    init(dbn: String, numOfSATTestTakers: String, schoolName: String, avgCriticalReadingScore: String, avgMathScore: String, avgWritingScore: String) {
        self.dbn = dbn
        self.numOfSATTestTakers = numOfSATTestTakers
        self.schoolName = schoolName
        self.avgCriticalReadingScore = avgCriticalReadingScore
        self.avgMathScore = avgMathScore
        self.avgWritingScore = avgWritingScore
    }
    
    private enum CodingKeys: String, CodingKey {
        case dbn
        case numOfSATTestTakers = "num_of_sat_test_takers"
        case schoolName = "school_name"
        case avgCriticalReadingScore = "sat_critical_reading_avg_score"
        case avgMathScore = "sat_math_avg_score"
        case avgWritingScore = "sat_writing_avg_score"
    }
}
