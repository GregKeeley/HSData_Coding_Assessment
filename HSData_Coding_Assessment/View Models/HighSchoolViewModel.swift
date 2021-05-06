//
//  HighSchoolViewModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import Foundation

struct HighSchoolViewModel {
    
    let schoolName: String, neighborhood: String, dbn: String
    
    init(highSchool: HighSchool) {
        
        self.schoolName = highSchool.schoolName
        self.neighborhood = highSchool.neighborhood
        self.dbn = highSchool.dbn
            
    }

}
