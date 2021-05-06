//
//  HighSchoolViewModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolViewModel {
    
    let schoolName: String, neighborhood: String, dbn: String
    
    init(highSchool: HighSchool) {
        
        self.schoolName = highSchool.school_name ?? "No name available"
        self.neighborhood = highSchool.neighborhood ?? "No neighborhood available"
        self.dbn = highSchool.dbn ?? "dbn not available"
            
    }

}
