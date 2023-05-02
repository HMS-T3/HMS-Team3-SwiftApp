//
//  DoctorDatesCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//
import UIKit
class DoctorDatesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DoctorDatesCollectionViewCell"
    
    private let dayLabel: UILabel = {
        
        let label = UILabel()
        label.text = "MON"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(dateLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
                dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                dayLabel.heightAnchor.constraint(equalToConstant: 40),
                
                dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
                dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
            ]
        )
    }
    
    public func configure(date: String, day: String) {
        dayLabel.text = day
        dateLabel.text = date
    }
    
}
