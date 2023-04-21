//
//  User.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
//

import Foundation
import UIKit

struct User {
	let role: Roles
	let id: String
	let info: PersonalInfo?
}

struct PersonalInfo {
	let name: String
	let image: String?
	let dob: Double
	let phoneNumber: Int
	let email: String?
	let biologicalGender: Gender
	let records: [HealthRecords]?
}
 
struct HealthRecords {
	let doctor: User
	let reasonOfVisit: String
	let date: Date
	let vitals: Vitals
}

struct Vitals {
	let height: Int
	let weight: Int
	let blood: String
	let bloodPresure: BloodPresure
	let pulse: Int
	let bodyTemperature: Int
	let oxygenLevel: Int
}

struct BloodPresure {
	let systolic: Int
	let diastolic: Int
}

struct PatientHistory {
	let allergies: [String]
	let medicalCondition: String
}

struct Prescritpion {
	let diagonisis: String
	let medicene: [PrescribedMedicene]?
	let labTests: [LabTest]?
}

struct PrescribedMedicene {
	let name: String
	let dosage: Dosage
}

struct LabTest {
	let name: String
	let results: String
}

struct Dosage {
	let timeOfTheDay: MediceneTime
	let amount: [Int]
	let amountType: DosageAmountType
}

