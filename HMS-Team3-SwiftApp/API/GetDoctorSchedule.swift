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
    
    func getDoctorSchedule(completion: @escaping(Result<UpcomingDetails, Error>) -> Void,  doctorID: String, day: String) {
        print("doctorID \(doctorID) day \(day)")
        let url = URL(string: "\(Constants.baseURL)/getScheduleDetailsForADay?doctor_id=\(doctorID)&populate=true&day=\(day)")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data,
                  error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(UpcomingDetails.self, from: data)
                completion(.success(response))
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func bookAppointment(completion: @escaping(Result<BookAppointment, Error>) -> Void, patientID: String, doctorID: String, date: String, startTime: String, endTime: String) {
        
        let url = URL(string: "\(Constants.baseURL)/book_appointment/patient?patient_id=\(patientID)")!
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let requestBodyData = "doctor_id=\(doctorID)&day=\(date)&startTime=\(startTime)&endTime=\(endTime)".data(using: .utf8)
        
        request.httpBody = requestBodyData
        
        request.setValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
        request.setValue("Origin, X-Requested-With, Content-Type, Accept", forHTTPHeaderField: "Access-Control-Allow-Headers")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
            
            do {
                //				let rawJSON = JSONse
                let results = try JSONDecoder().decode(BookAppointment.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
    
}
