//
//  UpdateDoctorAvailability.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 01/05/23.
//

import Foundation
import UIKit

class UpdateDoctorAvailability{
    
    static let shared = UpdateDoctorAvailability()
    
    func updateDoctorAvailability(completion: @escaping (Result<UpdateAvailability, Error>) -> Void , day: String?, startTime: String?, endTime: String?) {
        var request: URLRequest
        let requestBodyData: Data?
        
            let doctorId = UserDefaults.standard.string(forKey: "DoctorID")
        guard let url = URL(string: "\(Constants.baseURL)/addAvailability?doctorId=\(doctorId!)") else {return}
            request = URLRequest(url: url)
            request.httpMethod = "POST"
            requestBodyData = "day=\(day!)&startTime=\(startTime!)&endTime=\(endTime!)".data(using: .utf8)
            
            request.httpBody = requestBodyData
            
            request.setValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
            request.setValue("Origin, X-Requested-With, Content-Type, Accept", forHTTPHeaderField: "Access-Control-Allow-Headers")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil,
                      let data = data else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(UpdateAvailability.self, from: data)
                    if results.status {
                        completion(.success(results))
                        DispatchQueue.main.async {
                            print(results.response?.Message)
                        }
                    } else {
                        completion(.failure(APIError.BookingAlreadyExists))
                        DispatchQueue.main.async {
                            print(results.response?.Message)
                        }
                    }
                    
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
    }
    
}
