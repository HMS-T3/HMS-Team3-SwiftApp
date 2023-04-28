//
//  Home.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
//

import Foundation

enum Categories: Codable {
	case Dental
	case Ortho
	case Covid19
}

struct Home: Codable {
	let upcommingAppointment: Appointment?
	let prescritpion: [Prescritpion]?
	let categories: Categories
}

