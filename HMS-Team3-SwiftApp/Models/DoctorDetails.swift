//  DoctorAppointments.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//

/*
 {
	 "Response": {
		 "doctorInfo": {
			 "specialization": "Immunologists",
			 "degree": "MBBS",
			 "experience": "0",
			 "description": "A board-certified physician specializing in family medicine. She received her medical degree from the University of California, San Francisco, and completed her residency training at the University of California, Los Angeles."
		 },
		 "info": {
			 "profileImg": "https://randomuser.me/api/portraits/men/94.jpg",
			 "name": "Dr. Jakov Srećković",
			 "dateOfBirth": "1983-07-03T22:48:23.434Z",
			 "phoneNumber": "026-8328-062",
			 "biologicalGender": "male"
		 },
		 "_id": "64513ec5ca23da14efc86291",
		 "role": "doctor",
		 "phoneNumber": "0268328062",
		 "email": "jakov.sreckovic@example.com",
		 "availability": [
			 "64513ec7ca23da14efc862a6",
			 "64513ec7ca23da14efc862a9",
			 "64513ec7ca23da14efc862b6",
			 "64513ec7ca23da14efc862bc",
			 "64513ec7ca23da14efc862ba",
			 "64513ec7ca23da14efc862bf",
			 "64513ec7ca23da14efc862b4",
			 "64513ecaca23da14efc862f1",
			 "64513ecaca23da14efc862f5"
		 ],
		 "appointments": [],
		 "schedule": [],
		 "emergencyContacts": [],
		 "created": "2023-05-02T16:48:05.243Z"
	 },
	 "Status": true
 }
 */

import Foundation

struct DoctorDetails: Codable {
    
    let Response: DoctorResponse
}

struct DoctorResponse: Codable {
    let doctorInfo: DoctorInfo
    let info: AdditionalInfo
	let _id: String
	let role: String
	let phoneNumber: String
	let email: String?
	
}
struct DoctorInfo: Codable {
    
    let specialization: String
    let degree: String
    let experience: String
    let description: String
}
struct AdditionalInfo: Codable {
    
    let profileImg: String
    let name: String
    let dateOfBirth: String
    let biologicalGender: String
}



