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
        
        DoctorView.layer.borderWidth = 0.5
        DoctorView.layer.borderColor = UIColor(named: "secondary")?.cgColor
        DoctorView.layer.cornerRadius = 20
    
        
        DoctorEducation.text = "btech"
        DoctorName.text = "HMS3"
        DoctorImage.image = #imageLiteral(resourceName: "Doctor")
        // Initialization code
    }

}
