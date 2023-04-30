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
    case UserNotFound
}

class UserAuthentication {
    
    static let shared = UserAuthentication()
    
	func registerPatient(completion: @escaping (Result<LoginPatient, Error>) -> Void, email: String?, uniqueID: String?, pNumber: String?) { // Correct Unique spelling
        
		var url: URL
		var request: URLRequest
		let requestBodyData: Data?
		
		if let email = email,
		   let uniqueID = uniqueID {
			url = URL(string: "\(Constants.baseURL)/register/patient")! // Re-Verify this
			request = URLRequest(url: url)
			request.httpMethod = "POST"
			requestBodyData = "email=\(email)&password=\(uniqueID)".data(using: .utf8)
		} else {
			url = URL(string: "\(Constants.baseURL)/register/patient")! // Re-Verify this
			request = URLRequest(url: url)
			request.httpMethod = "POST"
			requestBodyData = "phoneNumber=\(pNumber!)".data(using: .utf8)
		}
        
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
    
	func loginPatient(completion: @escaping(Result<LoginPatient, Error>) -> Void, email: String?, uniqueID: String?, pNumber: String?) {
        
		var url: URL
		var request: URLRequest
		let requestBodyData: Data?
		
		if let email = email,
		   let uniqueID = uniqueID {
			url = URL(string: "\(Constants.baseURL)/login/patient")! // Re-Verify this
			request = URLRequest(url: url)
			request.httpMethod = "POST"
			requestBodyData = "email=\(email)&password=\(uniqueID)".data(using: .utf8)
		} else {
			url = URL(string: "\(Constants.baseURL)/login/patient")! // Re-Verify this
			request = URLRequest(url: url)
			request.httpMethod = "POST"
			requestBodyData = "phoneNumber=\(pNumber!)".data(using: .utf8) // dont provide +91
		}
		
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
					completion(.failure(APIError.UserNotFound))
				}
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
    //doctor login
    func doctorLogin(parameters:[String:String],completionHandler: @escaping (Result<LoginDoctor, Error>) -> Void) {
        
        let route = "/login/staff"
        let url = URL(string: "\(Constants.baseURL)\(route)")!
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
         let requestData = parameters
         let jsonData = try! JSONEncoder().encode(requestData)
         request.httpBody = jsonData
         
         let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
             if let error = error {
                 completionHandler(.failure(error))
                 return
             }
             
             guard let data = data,
                   let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode == 200 else {
                 completionHandler(.failure(NSError(domain: "com.example.postRequest", code: -1,
                                                     userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                 return
             }
             
             do {
                 let responseData = try JSONDecoder().decode(LoginDoctor.self, from: data)
                 completionHandler(.success(responseData))
             } catch {
                 completionHandler(.failure(error))
             }
         }
         
         task.resume()
     }
    
    
    
}
