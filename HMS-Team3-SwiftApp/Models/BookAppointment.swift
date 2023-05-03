//
//  BookAppointment.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 03/05/23.
//

import Foundation

struct BookAppointment: Codable {
	
	let Response: AppointmentResponse
	let Status: Bool
}

struct AppointmentResponse: Codable {
	let Message: String
}
