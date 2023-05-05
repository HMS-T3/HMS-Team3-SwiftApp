//
//  GetOngoingMedication.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 05/05/23.
//

import Foundation
import UIKit

class GetOngoingMedication{
    static let shared = GetOngoingMedication()
    
    func getOngoingMedication(completion: @escaping(Result<OngoingMedication, Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/getMedicine?getMedicines=2") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                print("return")
                return
            }
            do{
                let results  = try JSONDecoder().decode(OngoingMedication.self, from: data)
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
