//
//  ChatResponse.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

/*
 {
	 "Response": [
		 {
			 "_id": "645294bfa3cedc324567cbdd",
			 "timeSlot": "645294afa3cedc324567cbd5",
			 "completed": false,
			 "chat": true,
			 "doctor": {
				 "info": {
					 "name": "Dr. Carter Riley"
				 },
				 "_id": "645221011a75665fac135608",
				 "phoneNumber": "01697397706",
				 "email": "ujjwal@hms-doctor.in"
			 },
			 "patient": {
				 "info": {
					 "name": ""
				 },
				 "_id": "6452944ba3cedc324567cbcc",
				 "phoneNumber": "9287090679",
				 "email": ""
			 },
			 "created": "2023-05-03T17:07:11.989Z",
			 "__v": 0
		 }
	 ],
	 "Status": true
 }
 */

import Foundation

struct ChatModel: Codable {
	
	let Response: [ChatResponse]
}

struct ChatResponse: Codable {
	
	let doctor: DoctorChat
	let patient: PatientChat
}

struct DoctorChat: Codable {
	
	let info: DoctorChatInfo
	let _id: String
	let phoneNumber: String
	let email: String
}

struct DoctorChatInfo: Codable {
	let name: String
	let profileImg: String
}

struct PatientChat: Codable {
	let _id: String
	let info: PatientInfo
	let phoneNumber: String
}

struct PatientInfo: Codable {
	
	let profileImg: String
	let name: String
}
