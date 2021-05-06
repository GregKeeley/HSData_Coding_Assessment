//
//  HighSchoolTableViewCell.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import UIKit

class HighSchoolTableViewCell: UITableViewCell {
    
    var highSchoolViewModel: HighSchoolViewModel! {
        didSet {
            textLabel?.text = highSchoolViewModel.schoolName
            detailTextLabel?.text = highSchoolViewModel.neighborhood
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.sizeToFit()
        textLabel?.textColor = AppColors.primaryDarkBlue
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20,
                                                  weight: .light)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
