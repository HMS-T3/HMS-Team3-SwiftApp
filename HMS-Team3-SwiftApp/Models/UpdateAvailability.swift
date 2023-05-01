//
//  UpdateAvailability.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 01/05/23.
//

import Foundation
import UIKit

struct UpdateAvailability: Codable {
    let response: Response?
    let status: Bool
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case status = "Status"
    }
}
