//
//  DoctorsAvailable.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 03/05/23.
//

/*
 {
	 "Response": [
		 [
			 "11:00",
			 "11:30"
		 ],
		 [
			 "11:30",
			 "12:00"
		 ],
		 [
			 "09:00",
			 "09:30"
		 ],
		 [
			 "13:00",
			 "13:30"
		 ],
		 [
			 "12:30",
			 "13:00"
		 ],
		 [
			 "09:30",
			 "10:00"
		 ],
		 [
			 "10:30",
			 "11:00"
		 ],
		 [
			 "10:00",
			 "10:30"
		 ],
		 [
			 "12:00",
			 "12:30"
		 ]
	 ],
	 "Status": true
 }
 */

import Foundation

struct DoctorAvailable: Codable {
	
	let Response: [[String]]?
	let Status: Bool
	
}
