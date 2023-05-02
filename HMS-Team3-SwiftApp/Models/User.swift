//
//  User.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
//

import Foundation
import UIKit

struct User: Codable {
    let userResponse: UserResponse
    let status: Bool
    enum CodingKeys: String, CodingKey {
        case userResponse = "Response"
        case status = "Status"
    }
}

struct UserResponse: Codable {
    let info: PersonalInfo?
    let role: String?
    let phoneNumber: String?
    let email: String?
    let password: String?
    let appointments: [String]?
    let schedule : [String]?
    let emergencyContacts: [String]?
}
struct PersonalInfo: Codable {
    let profileImg: String?
	let name: String?
	let dateOfbirth: Date?
	let phoneNumber: String?
//	let biologicalGender: Gender?
    let biologicalGender: String?
}

struct HealthRecords: Codable {
	let doctor: User
	let reasonOfVisit: String
	let date: Date
	let vitals: Vitals
}

struct Vitals: Codable {
	let height: Int
	let weight: Int
	let blood: String
	let bloodPresure: BloodPresure
	let pulse: Int
	let bodyTemperature: Int
	let oxygenLevel: Int
}

struct BloodPresure: Codable {
	let systolic: Int
	let diastolic: Int
}

struct PatientHistory: Codable {
    let allergies: [String]
    let medicalCondition: String
}

struct MedicalHistory: Codable {
    let allergies: [String]
    let chronicDiseases: [String]
    let previousSurgeries: [String]
    let vaccinations: [String]
}

struct Prescription: Codable {
	let diagonisis: String
	let medicine: [PrescribedMedicine]?
	let labTests: [LabTest]?
}

struct PrescribedMedicine: Codable {
	let name: String
	let dosage: Dosage
}

struct LabTest: Codable {
	let name: String
	let results: String
}

struct Dosage: Codable {
	let timeOfTheDay: MedicineTime
	let amount: [Int]
	let amountType: DosageAmountType
}

struct Specializations: Codable {
    let Specialization: [Specialization]
    
    enum CodingKeys: String, CodingKey {
        case Specialization = "Response"
    }
}
struct Specialization: Codable {
    let specialization: String
    let description: String
    let imgUrl:  String
}
