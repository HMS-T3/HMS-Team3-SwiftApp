//
//  TopDoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 20/04/23.
//

import UIKit

class TopDoctorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopDoctorCollectionViewCell"

    @IBOutlet var TopDoctorName: UILabel!
    @IBOutlet var TopDoctorSpecializationLabel: UILabel!
    @IBOutlet var TopDoctorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TopDoctorImage.clipsToBounds = false
        TopDoctorImage.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        TopDoctorImage.layer.borderWidth = 1
        TopDoctorImage.layer.cornerRadius = 20
        TopDoctorImage.clipsToBounds = true
        TopDoctorImage.layer.cornerRadius = 10
    
        TopDoctorName.text = "HMS3"
        TopDoctorImage.image = #imageLiteral(resourceName: "Doctor")
        TopDoctorSpecializationLabel.text = "Btech"
        // Initialization code
    }

}
