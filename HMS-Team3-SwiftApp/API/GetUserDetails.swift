//
//  GetUserDetails.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 26/04/23.
//

import Foundation

class GetUserDetails {
    static let shared = GetUserDetails()
    
    func getPatient(completion: @escaping (Result<User, Error>) -> Void) {
        
        let patientID = UserDefaults.standard.string(forKey: "PatientID")
        
        guard let url = URL(string: "\(Constants.baseURL)/getUserDetails?user_id=\(patientID!)&role=patient") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
                do {
                    let results = try JSONDecoder().decode(User.self, from: data)
                    print(results)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        task.resume()
        }
    
    func getDoctor(completion: @escaping (Result<User, Error>) -> Void) {
        
        let doctorId = UserDefaults.standard.string(forKey: "DoctorID")
        
        guard let url = URL(string: "\(Constants.baseURL)/getUserDetails?user_id=\(doctorId!)&role=doctor&detailsYouDontNeed=emergencyContacts,created") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
                do {
                    let results = try JSONDecoder().decode(User.self, from: data)
                    print(results)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        task.resume()
        }
}


