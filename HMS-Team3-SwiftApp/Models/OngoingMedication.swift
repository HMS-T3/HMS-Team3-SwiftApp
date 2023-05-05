//
//  OngoingMedication.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 05/05/23.
//
//{
//    "Response": [
//        {
//            "medicineName": "Glucophage (Metformin)",
//            "description": "A medication used to treat type 2 diabetes. It works by decreasing the amount of glucose produced by the liver and increasing the body's sensitivity to insulin.",
//            "imgUrl": "https://res.cloudinary.com/dujgzpuyd/image/upload/v1683181935/Medicine%20Names/glucophage_xri9r2.svg",
//            "morning": 4,
//            "afternoon": 1,
//            "night": 2
//        },
//        {
//            "medicineName": "Zoloft (Sertraline)",
//            "description": "An antidepressant medication used to treat depression, obsessive-compulsive disorder, panic disorder, and other mental health conditions. It works by increasing the levels of serotonin in the brain.",
//            "imgUrl": "https://res.cloudinary.com/dujgzpuyd/image/upload/v1683181917/Medicine%20Names/Zoloft_arxtje.svg",
//            "morning": 1,
//            "afternoon": 3,
//            "night": 4
//        }
//    ],
//    "Status": true
//}

import Foundation

struct OngoingMedication: Codable {
    let Response: [MedicationResponse]?
    let Status: Bool
}

struct MedicationResponse: Codable {
    let medicineName: String
    let description: String
    let imgUrl: String
    let morning: Int
    let afternoon: Int
    let night: Int
}
