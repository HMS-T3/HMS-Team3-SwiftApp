//  DoctorAppointments.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//
import Foundation
struct DoctorAppointment: Codable {
    
    let Response: [DoctorResponse]
}
struct DoctorResponse: Codable {
    
    let doctor: DoctorInfoStruct
}
struct DoctorInfoStruct: Codable {
    let doctorInfo: DoctorInfo
    let info: AdditionalInfo
}
struct DoctorInfo: Codable {
    
    let specialization: String
    let degree: String
    let experience: String
    let description: String
}
struct AdditionalInfo: Codable {
    
    let profileImg: String
    let name: String
    let dateOfBirth: String
    let phoneNumber: String
    let biologicalGender: String
}



