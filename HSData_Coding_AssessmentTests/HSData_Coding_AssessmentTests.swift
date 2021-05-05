//
//  HSData_Coding_AssessmentTests.swift
//  HSData_Coding_AssessmentTests
//
//  Created by Gregory Keeley on 5/5/21.
//

import XCTest
@testable import HSData_Coding_Assessment

class HSData_Coding_AssessmentTests: XCTestCase {

    func testNetworkHelper() {
        let exp = XCTestExpectation(description: "fetched Data")
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
            XCTFail("Failed to fetch data: \(appError)")
            case .success(let data):
                XCTAssertGreaterThan(data.count, 1)
                exp.fulfill()
            }
        }
    }

}
