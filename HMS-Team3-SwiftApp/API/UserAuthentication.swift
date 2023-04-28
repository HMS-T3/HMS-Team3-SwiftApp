//
//  UserAuthentication.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 24/04/23.
//

import Foundation

//struct Constants {
//
//    static let baseURL = "https://hmst3-backend.onrender.com/app"
//}

enum APIError: Error {
    case UnableToRegisterPatient
}

class UserAuthentication {
    
    static let shared = UserAuthentication()
    
    func registerPatient(completion: @escaping (Result<LoginPatient, Error>) -> Void, email: String, uniqueID: String) {
        
        guard let url = URL(string: "\(Constants.baseURL)/register/patient?email=\(email)&password=\(uniqueID)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let requestBodyData = "email=\(email)&password=\(uniqueID)".data(using: .utf8)
        request.httpBody = requestBodyData
        
        request.setValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
        request.setValue("Origin, X-Requested-With, Content-Type, Accept", forHTTPHeaderField: "Access-Control-Allow-Headers")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(LoginPatient.self, from: data)
                if results.status {
                    completion(.success(results))
                } else {
                    print("User Already Exists")
                }
                
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func loginPatient(completion: @escaping(Result<LoginPatient, Error>) -> Void, email: String, uniqueID: String) {
        
        guard let url = URL(string: "\(Constants.baseURL)/login/patient?email=\(email)&password=\(uniqueID)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let requestBodyData = "email=\(email)&password=\(uniqueID)".data(using: .utf8)
        request.httpBody = requestBodyData
        
        request.setValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
        request.setValue("Origin, X-Requested-With, Content-Type, Accept", forHTTPHeaderField: "Access-Control-Allow-Headers")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(LoginPatient.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
