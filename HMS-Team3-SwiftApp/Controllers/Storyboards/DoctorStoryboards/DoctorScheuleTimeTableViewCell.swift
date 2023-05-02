//
//  DoctorScheuleTimeTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Ujjwalsingh Rajput on 28/04/23.
//

import UIKit

class DoctorScheuleTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeSlotLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
