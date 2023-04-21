//
//  Enums.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 17/04/23.
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

enum MediceneTime {
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
