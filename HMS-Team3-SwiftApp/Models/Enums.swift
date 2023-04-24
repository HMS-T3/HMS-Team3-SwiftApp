//
//  Enums.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import UIKit
import Foundation

enum Roles {
    case Patient
    case Doctor
    case Admin
}

enum Gender: String {
    case Male = "Male"
    case Female = "Female"
}

enum MedicineTime {
    case BeforeBreakfast
    case AfterBreakfast
    case BeforeLunch
    case AfterLunch
    case BeforeDinner
    case AfterDinner
}

enum DosageAmountType {
    case Liquid
    case Tablets
    case Drops
}
