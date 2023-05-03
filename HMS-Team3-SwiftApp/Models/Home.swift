//
//  Home.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import Foundation
import UIKit

struct Categories {
    let categoryImage: UIImage?
    let categoryName: CategoryTypes?
}

enum CategoryTypes: String {
    case general = "General"
    case lungSpecialist = "Lung Specialist"
    case dentist = "Dentist"
    case psychiatrist = "Psychiatrist"
    case covid19 = "Covid 19"
    case surgeon = "Surgeon"
    case nephrologist = "Nephrologists"
    case cardiologist = "Cardiologist"
    case neurologist = "Neurologist"
    case physician = "Family Physicians"
}

struct Home {
    let upcomingAppointment: Appointment?
    let prescription: [Prescription]?
    let categories: Categories
}

