//
//  UpdateUserDetails.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 27/04/23.
//

import Foundation

class UpdateUserDetails {
    
    static let shared = UpdateUserDetails()
    
    func updatePatient(completion: @escaping (Result<User, Error>) -> Void, name: String, phoneNumber: String, imgUrl: String) {
        
		print("Inside Update Patient")
		let role = "patient"
        let patientID = UserDefaults.standard.string(forKey: "PatientID")
		print(patientID)
		guard let url = URL(string: "\(Constants.baseURL)/update_user_profile/patient?user_id=\(patientID!)&role=\(role)") else {
			return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        let requestBodyData = "name=\(name)&contactNumber=\(phoneNumber)&profileImg=\(imgUrl)".data(using: .utf8)
        request.httpBody = requestBodyData
        
        request.setValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
        request.setValue("Origin, X-Requested-With, Content-Type, Accept", forHTTPHeaderField: "Access-Control-Allow-Headers")
        
		print("Task Initiliazed")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
			print("Inside task")
            guard error == nil,
                  let data = data else {
                return
            }
                        
            do {
                let results = try JSONDecoder().decode(User.self, from: data)
				print("Update Successful")
				print(results)
                completion(.success(results))
                
            } catch {
				print("error")
				print(error)
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
