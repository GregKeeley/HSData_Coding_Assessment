//
//  HighSchoolDataAPIClient.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/5/21.
//

import Foundation

class HighSchoolDataAPIClient {
    
    static func fetchHighSchools(completion: @escaping (Result<[HighSchool], AppError>) -> ()) {
        let highSchoolAPIEndpoint = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: highSchoolAPIEndpoint) else {
            completion(.failure(.badURL(highSchoolAPIEndpoint)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let highSchools = try JSONDecoder().decode([HighSchool].self, from: data)
                    completion(.success(highSchools))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func fetchSATScores(completion: @escaping (Result<[HighSchoolSATScore], AppError>) -> ()) {
        let HighSchoolSATScoreAPIEndpoint = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        guard let url = URL(string: HighSchoolSATScoreAPIEndpoint) else {
            completion(.failure(.badURL(HighSchoolSATScoreAPIEndpoint)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let highSchools = try JSONDecoder().decode([HighSchoolSATScore].self, from: data)
                    completion(.success(highSchools))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
