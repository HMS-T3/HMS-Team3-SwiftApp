//
//  DoctorInformation.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//

import Foundation

class DoctorInformation {
    
    static let shared = DoctorInformation()
    
    func getDoctorInformation(completion: @escaping(Result<DoctorAppointment, Error>) -> Void, doctorID: String) {
        
        let url = URL(string: "\(Constants.baseURL)/get_schedule_details?doctor_id=\(doctorID)&populate=true")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data,
                  error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(DoctorAppointment.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
