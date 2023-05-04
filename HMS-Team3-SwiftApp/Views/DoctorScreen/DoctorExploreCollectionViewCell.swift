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
    
    static let weekdays = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
    static let identifier = "DoctorExploreCollectionViewCell"
    
    private let dayLabel: UILabel = {
        
        let label = UILabel()
        label.text = "MON"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor(named: "date")
        return label
    }()
    
    private let dateLabel: UILabel = {
        
        let label = UILabel()
        label.text = "17"
        label.font = .boldSystemFont(ofSize: 45)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        ExploreView.layer.cornerRadius = 5
        ExploreView.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        
    }
    
    public func DoctorConfigure(date: String, day: String) {
        dayLabel.text = day
        dateLabel.text = date
    }
}
