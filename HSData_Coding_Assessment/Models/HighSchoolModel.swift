//
//  HighSchoolModel.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import Foundation

class HighSchool: Decodable {
    
    let dbn: String?, schoolName: String?, neighborhood: String?
    
    private enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case neighborhood
    }
}
