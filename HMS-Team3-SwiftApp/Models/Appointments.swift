//
//  Appointments.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import Foundation
import UIKit

//MARK: Appointments Tab

enum AppointmentStatus: Codable {
	case Active
	case Cancelled
	case Completed
}

struct Appointments: Codable {
	
	let data: [Appointment]?
}

struct Appointment: Codable {
	let date: Date
	let doctorName: String
	let doctorID: String
	let patientName: String
	let patientID: String
	let location: Location?
	let specialization: String
	let status: AppointmentStatus
	let rescheduled: Bool
}

struct Location: Codable {
	let longitude: Double
	let latitude: Double
}
