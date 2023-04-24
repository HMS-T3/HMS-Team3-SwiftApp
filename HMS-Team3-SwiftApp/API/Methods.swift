//
//  APICalls.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 19/04/23.
//

import Foundation
//import Alamofire

class Methods{
    let baseURI:String
    init(baseURI:String){
        self.baseURI = baseURI
    }
//    func GET(route:String){
//        AF.request("\(baseURI)\(route)", method: .get)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    print("JSON: \(value)")
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//    func POST(route:String,parameters:[String:String]){
//        AF.request("\(baseURI)\(route)", method: .post, parameters: parameters)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    print("JSON: \(value)")
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
