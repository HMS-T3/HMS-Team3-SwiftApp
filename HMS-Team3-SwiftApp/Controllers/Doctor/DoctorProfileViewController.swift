//
//  DoctorProfileViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 01/05/23.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    @IBOutlet var doctorProfile: UIImageView!
    @IBOutlet var nameContainerView: UIView!
    @IBOutlet var ageContainerView: UIView!
    @IBOutlet var phoneContainerView: UIView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var sexContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the calendar style
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
//        datePicker.backgroundColor = UIColor(named: "secondary")
        datePicker?.locale = .current
//        datePicker.setValue(UIColor.white, forKey: "textColor")
//        datePicker.setValue(false, forKeyPath: "highlightsToday")
//        datePicker.setValue(0.7, forKeyPath: "alpha")
        doctorProfile.layer.cornerRadius = doctorProfile.frame.width / 2
        nameContainerView.layer.cornerRadius = 5
        ageContainerView.layer.cornerRadius = 5
        sexContainerView.layer.cornerRadius = 5
        phoneContainerView.layer.cornerRadius = 5
    }

}
