//
//  DoctorExploreCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 30/04/23.
//

import UIKit

class DoctorExploreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var ExploreView: UIView!
    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var DayLabel: UILabel!
    
    static let identifier = "DoctorExploreCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        DayLabel.text = "Mon"
        DateLabel.text = "21"
        ExploreView.layer.cornerRadius = 5
        ExploreView.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        
        
        
    }

}
