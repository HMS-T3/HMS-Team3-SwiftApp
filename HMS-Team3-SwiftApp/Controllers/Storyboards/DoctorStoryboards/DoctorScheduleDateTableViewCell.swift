//
//  DoctorScheduleDateTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Ujjwalsingh Rajput on 28/04/23.
//

import UIKit

class DoctorScheduleDateTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
