//
//  Extensions.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 21/04/23.
//

import Foundation

protocol ProfileHeaderUIViewDelegate {
	func clickedOnEditButton()
}

protocol DoctorDatesTableViewCellDelegate {
	func clickedOnDateButton(dateOffset: Int)
}

protocol DoctorTimeSlotsTableViewCellDelegate {
	func clickedOnTimeCell(time: [String], date: String)
	func noSlots()
}

protocol DoctorExploreViewControllerDelegate{
    func clickedOnDateButton(dateOffset: Int)
}
