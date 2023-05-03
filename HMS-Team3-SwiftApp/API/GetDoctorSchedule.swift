//
//  DoctorInformation.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//

import Foundation

class DoctorInformation {
    
    static let shared = DoctorInformation()
    
	func isDoctorAvailable(completion: @escaping(Result<DoctorAvailable, Error>) -> Void, doctorID: String, day: String) {
        
        let url = URL(string: "\(Constants.baseURL)/getAvailableTimeSlots?doctor_id=\(doctorID)&day=\(day)&booked=false")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data,
                  error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(DoctorAvailable.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
