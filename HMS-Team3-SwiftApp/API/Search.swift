//
//  Search.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 04/05/23.
//

import Foundation

struct Search{
    func searchByName(searchStr:String,completion: @escaping(Result<SearchPatientResponse, Error>) -> Void) {
        
        let url = URL(string: "\(Constants.baseURL)/search?searchString=\(searchStr)&searchBy=name")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data,
                  error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(SearchPatientResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

}
