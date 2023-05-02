//
//  DoctorExploreCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 30/04/23.
//

import UIKit

class DoctorExploreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var DayLabel: UILabel!
    static let identifier = "DoctorExploreCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        DayLabel.text = "Monday"
        DateLabel.text = "21"
        
        
        
    }

}
