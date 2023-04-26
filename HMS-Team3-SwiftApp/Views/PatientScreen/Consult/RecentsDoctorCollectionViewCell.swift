//
//  RecentsDoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 21/04/23.
//

import UIKit

class RecentsDoctorCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecentsDoctorCollectionViewCell"
    
    @IBOutlet var RecentDocImageLabel: UIImageView!
    
    @IBOutlet var RecentDocNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        RecentDocImageLabel.image = #imageLiteral(resourceName: "Doctor")
        RecentDocNameLabel.text = "HMS3"
        // Initialization code
    }
   
    
  

}
