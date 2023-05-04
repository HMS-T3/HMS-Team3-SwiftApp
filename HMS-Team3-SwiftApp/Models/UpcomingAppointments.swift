//
//  UpcomingAppointments.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 03/05/23.
//

//{
//    "Response": [
//        {
//            "chat": false,
//            "timeSlot": {
//                "time": {
//                    "startTime": "11:00",
//                    "endTime": "11:30"
//                },
//                "user": "645221011a75665fac135608",
//                "day": "05-05-2023",
//                "booked": true,
//                "created": "2023-05-03T08:53:22.402Z"
//            },
//            "completed": false,
//            "doctor": {
//                "doctorInfo": {
//                    "specialization": "Infectious Disease Specialistss",
//                    "degree": "MBBS",
//                    "experience": "0",
//                    "description": "A board-certified physician specializing in family medicine. She received her medical degree from the University of California, San Francisco, and completed her residency training at the University of California, Los Angeles."
//                },
//                "info": {
//                    "profileImg": "https://randomuser.me/api/portraits/men/45.jpg",
//                    "name": "Dr. Carter Riley",
//                    "dateOfBirth": "1952-09-26T08:52:31.941Z",
//                    "phoneNumber": "016973 97706",
//                    "biologicalGender": "male"
//                },
//                "_id": "645221011a75665fac135608",
//                "email": "ujjwal@hms-doctor.in"
//            },
//            "patient": {
//                "info": {
//                    "profileImg": "https://lh3.googleusercontent.com/a/AGNmyxZnzyjwdxe82HlzuwhE9kGI7jkUPDcCnYXqHy9_=s96-c",
//                    "phoneNumber": "",
//                    "name": "SHIVACHARAN REDDY Y S (RA2011032010037)",
//                    "dateOfBirth": null,
//                    "biologicalGender": ""
//                },
//                "_id": "645226611a75665fac13565e",
//                "email": "sr7023@srmist.edu.in"
//            },
//            "created": "2023-05-03T10:07:14.412Z"
//        },
//        {
//            "chat": false,
//            "timeSlot": {
//                "time": {
//                    "startTime": "12:00",
//                    "endTime": "12:30"
//                },
//                "user": "645221011a75665fac135608",
//                "day": "05-05-2023",
//                "booked": true,
//                "created": "2023-05-03T08:53:22.400Z"
//            },
//            "completed": false,
//            "doctor": {
//                "doctorInfo": {
//                    "specialization": "Infectious Disease Specialistss",
//                    "degree": "MBBS",
//                    "experience": "0",
//                    "description": "A board-certified physician specializing in family medicine. She received her medical degree from the University of California, San Francisco, and completed her residency training at the University of California, Los Angeles."
//                },
//                "info": {
//                    "profileImg": "https://randomuser.me/api/portraits/men/45.jpg",
//                    "name": "Dr. Carter Riley",
//                    "dateOfBirth": "1952-09-26T08:52:31.941Z",
//                    "phoneNumber": "016973 97706",
//                    "biologicalGender": "male"
//                },
//                "_id": "645221011a75665fac135608",
//                "email": "ujjwal@hms-doctor.in"
//            },
//            "patient": {
//                "info": {
//                    "profileImg": "https://lh3.googleusercontent.com/a/AGNmyxZnzyjwdxe82HlzuwhE9kGI7jkUPDcCnYXqHy9_=s96-c",
//                    "phoneNumber": "",
//                    "name": "SHIVACHARAN REDDY Y S (RA2011032010037)",
//                    "dateOfBirth": null,
//                    "biologicalGender": ""
//                },
//                "_id": "645226611a75665fac13565e",
//                "email": "sr7023@srmist.edu.in"
//            },
//            "created": "2023-05-03T09:20:52.133Z"
//        }
//    ],
//    "Status": true
//}

import Foundation

struct UpcomingDetails: Codable{
    let Response: [UpcomingResponse]?
    let Status: Bool
}

struct UpcomingResponse: Codable{
    let timeSlot: TimeSlot
    let completed: Bool
    let chat: Bool
    let doctor: UpcomingDoctorResponse
    let patient: UpcomingPatientResponse?
    let created: String
}

struct TimeSlot: Codable{
    let time: Time
    let user: String
    let booked: Bool
    let day: String
    let created: String
}

struct Time: Codable {
    let startTime: String
    let endTime: String
}

struct UpcomingPatientResponse: Codable{
    let info: AdditionalInfo
    let _id: String
    let email: String
}

struct UpcomingDoctorResponse: Codable {
    let doctorInfo: DoctorInfo
    let info: AdditionalInfo
    let _id: String
    let email: String
    let phoneNumber: String?
}
