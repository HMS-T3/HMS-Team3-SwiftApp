//
//  UpcomingAppointments.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 04/05/23.
//

import Foundation
import UIKit

//enum GetUpcomingAppointmentsAPIError {
//case failedToGetData
//}

class GetUpcomingAppointments{
    
    static let shared = GetUpcomingAppointments()
    
    func getUpcomingAppointments(completion: @escaping (Result<UpcomingDetails, Error>) -> Void){
        
        let patientID = UserDefaults.standard.string(forKey: "PatientID")
        
        guard let url = URL(string: "\(Constants.baseURL)/get_appointment_details?patientId=\(patientID!)&populate=true") else {return}
        
//        guard let url = URL(string: "\(Constants.baseURL)/get_appointment_details?patientId=645226611a75665fac13565e&populate=true") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                print("return")
                return
            }
            do{
                let results  = try JSONDecoder().decode(UpcomingDetails.self, from: data)
                completion(.success(results))
//                print(results.Response[0])
//                print(results.Status)
                
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
