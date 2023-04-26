//
//  DoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 24/04/23.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "DoctorCollectionViewCell"
    
    @IBOutlet var DoctorView: UIView!
    @IBOutlet var DoctorEducation: UILabel!
    @IBOutlet var DoctorImage: UIImageView!
    
    @IBOutlet var DoctorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DoctorView.clipsToBounds = false
        DoctorView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        DoctorView.layer.borderWidth = 1
        DoctorView.layer.cornerRadius = 20
    
        
        DoctorEducation.text = "btech"
        DoctorName.text = "HMS3"
        DoctorImage.image = #imageLiteral(resourceName: "Doctor")
        // Initialization code
    }

}
