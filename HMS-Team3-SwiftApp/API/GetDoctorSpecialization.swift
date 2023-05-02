//
//  GetDoctorSpecialization.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 28/04/23.
//


import Foundation

class GetDoctorSpecialization {
    
    static let shared = GetDoctorSpecialization()
    
    func getDoctorSpecialization(completion: @escaping (Result<Specializations, Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/get_specializations") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
                do {
                    let results = try JSONDecoder().decode(Specializations.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        task.resume()
        }
}

