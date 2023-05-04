//
//  SearchDoctors.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

import Foundation

struct SearchDoctors: Codable {
	
	let Response: [SearchResponse]
}

struct SearchResponse: Codable {
	
	let id: String
	let name: String
	let specialization: String
	let profileImg: String
	let gender: String
}
