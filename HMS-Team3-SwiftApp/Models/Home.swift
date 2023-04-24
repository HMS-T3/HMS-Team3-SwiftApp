//
//  Home.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import Foundation

enum Categories {
    case Dental
    case Ortho
    case Covid19
}

struct Home {
    
    let upcommingAppointment: Appointment?
    let prescritpion: [Prescription]?
    let categories: Categories
}
