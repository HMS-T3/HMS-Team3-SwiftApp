//
//  DoctorTimeTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 04/05/23.
//

import UIKit

class DoctorScheduleTimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeSlotLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureValues(patientDetails: UpcomingResponse){
        self.ageLabel.text = patientDetails.patient?.info.dateOfBirth
        self.genderLabel.text = patientDetails.patient?.info.biologicalGender
        self.nameLabel.text = patientDetails.patient?.info.name
        self.reasonLabel.text = "Cough, cold"
        self.timeSlotLabel.text = patientDetails.timeSlot.time.startTime
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
