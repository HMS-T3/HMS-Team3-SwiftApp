//
//  APICalls.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 19/04/23.
//

import Foundation

class Methods{
    let baseURI:String
    init(baseURI:String){
        self.baseURI = baseURI
    }
    
    func GET(route:String,completion: @escaping (Result<[String:Any], Error>) -> Void) {
           // Create a URL session
           let url = URL(string: "\(baseURI)\(route)")!
           let session = URLSession.shared

           // Create a data task to fetch the JSON data
           let task = session.dataTask(with: url) { data, response, error in
               // Check if there was an error
               if let error = error {
                   completion(.failure(error))
                   return
               }
               
               // Check if there is any data
               guard let data = data else {
                   completion(.failure(NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned from server."])))
                   return
               }
               
               do {
                   // Decode the JSON data using JSONDecoder
                   let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                   
   //                print(json!)
                   
                   // Call the completion handler with the fetched todo object
                   
                   completion(.success(json!))
               } catch {
                   completion(.failure(error))
               }
           }
           
           // Start the data task
           task.resume()
       }
       
       
       func POST(parameters:[String:String],route:String,completionHandler: @escaping (Result<[String:String], Error>) -> Void) {
           let url = URL(string: "\(baseURI)\(route)")!
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
                   let responseData = try JSONDecoder().decode([String:String].self, from: data)
                   completionHandler(.success(responseData))
               } catch {
                   completionHandler(.failure(error))
               }
           }
           
           task.resume()
       }
    }
}
