//
//  DoctorTimeSlotsCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//
import UIKit
class DoctorTimeSlotsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DoctorTimeSlotsCollectionViewCell"
    
    private let timeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "10:00 AM"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(timeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        timeLabel.frame = contentView.bounds
    }
	
	public func configure(with data: [String]) {
		timeLabel.text = data[0]
	}
}
