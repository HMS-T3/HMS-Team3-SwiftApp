//
//  User.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
//

import Foundation
import UIKit

struct User: Codable {
	let role: Roles
	let id: String
	let info: PersonalInfo?
}

struct PersonalInfo: Codable {
	let name: String
	let image: String?
	let dob: Double
	let phoneNumber: Int
	let email: String?
	let biologicalGender: Gender
	let records: [HealthRecords]?
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

