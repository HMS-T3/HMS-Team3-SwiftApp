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
    
    enum CodingKeys: String, CodingKey {
        case userResponse = "Response"
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
	let biologicalGender: Gender?
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

struct Prescritpion: Codable {
	let diagonisis: String
	let medicene: [PrescribedMedicene]?
	let labTests: [LabTest]?
}

struct PrescribedMedicene: Codable {
	let name: String
	let dosage: Dosage
}

struct LabTest: Codable {
	let name: String
	let results: String
}

struct Dosage: Codable {
	let timeOfTheDay: MediceneTime
	let amount: [Int]
	let amountType: DosageAmountType
}

