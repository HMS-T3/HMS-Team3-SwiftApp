//
//  Extensions.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 25/04/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
