//
//  Enums.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
//

import UIKit
import Foundation

enum Roles: Codable {
	case Patient
	case Doctor
	case Admin
}

enum Gender: String, Codable {
	case Male = "Male"
	case Female = "Female"
}

enum MediceneTime: Codable {
	case BeforeBreakfast
	case AfterBreakfast
	case BeforeLunch
	case AfterLunch
	case BeforeDinner
	case AfterDinner
}

enum DosageAmountType: Codable {
	case Liquid
	case Tablets
	case Drops
}
