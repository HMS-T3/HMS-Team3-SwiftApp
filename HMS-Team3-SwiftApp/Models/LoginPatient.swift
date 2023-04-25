//
//  LoginPatient.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 24/04/23.
//

import Foundation

struct LoginPatient: Codable {
	let response: Response?
	let status: Bool
	
	enum CodingKeys: String, CodingKey {
		case response = "Response"
		case status = "Status"
	}
}

struct Response: Codable {
	
	let id: String?
	let Message: String
}
