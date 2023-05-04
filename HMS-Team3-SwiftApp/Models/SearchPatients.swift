//
//  Search.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 04/05/23.
//

import Foundation

struct SearchPatientsResponse:Codable {
    let id:String
    let gender:String
    let name:String
    let profileImg:String
    let specialization:String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case gender = "gender"
        case name = "name"
        case profileImg = "profileImg"
        case specialization = "specialization"
        
    }
}

struct SearchPatientResponse:Codable {
    let Response:[SearchPatientsResponse]
    let Status:Bool
}
