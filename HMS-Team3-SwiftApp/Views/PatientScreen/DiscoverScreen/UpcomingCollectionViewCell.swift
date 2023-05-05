//
//  UpcomingCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 25/04/23.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    static let identifier = "UpcomingCollectionViewCell"
    
    private let doctorImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        imageView.layer.shadowRadius = 2.0
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let doctorNameText: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "Doc Name"
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 2
        textLabel.font = .boldSystemFont(ofSize: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let doctorSpecialization: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "Doc Specialization"
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 2
        textLabel.font = .boldSystemFont(ofSize: 14)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let upcomingDay: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "05/05/2023"
        textLabel.textAlignment = .left
        textLabel.font = .systemFont(ofSize: 14)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let upcomingStartTime: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "12:30"
        textLabel.clipsToBounds = true
        textLabel.textAlignment = .left
        textLabel.font = .systemFont(ofSize: 14)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let upcomingEndTime: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "12:30"
        textLabel.clipsToBounds = true
        textLabel.textAlignment = .left
        textLabel.font = .systemFont(ofSize: 14)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
//    private let timeView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true
//        view.backgroundColor = UIColor(red: 24/255.0, green: 154/255.0, blue: 142/255.0, alpha: 0.35)
//        return view
//    }()
//
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(doctorImageView)
        addSubview(doctorNameText)
        addSubview(doctorSpecialization)
//        addSubview(timeView)
        addSubview(upcomingDay)
        addSubview(upcomingStartTime)
        addSubview(upcomingEndTime)
        
        NSLayoutConstraint.activate([
                    // Image view constraints
            doctorImageView.topAnchor.constraint(equalTo: topAnchor,constant: 22),
            doctorImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            doctorImageView.widthAnchor.constraint(equalToConstant: 100),
            doctorImageView.heightAnchor.constraint(equalToConstant: 120),
                    // Text label constraints
            doctorNameText.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            doctorNameText.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            doctorNameText.widthAnchor.constraint(equalToConstant: 150),
            
            doctorSpecialization.topAnchor.constraint(equalTo: doctorNameText.bottomAnchor, constant: 7),
            doctorSpecialization.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            doctorSpecialization.widthAnchor.constraint(equalToConstant: 150),
            
//            timeView.topAnchor.constraint(equalTo: doctorSpecialization.bottomAnchor, constant: 7),
//            timeView.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
//            timeView.widthAnchor.constraint(equalToConstant: 150),
//            timeView.heightAnchor.constraint(equalToConstant: 50),
            
            upcomingDay.topAnchor.constraint(equalTo: doctorSpecialization.bottomAnchor, constant: 7),
            upcomingDay.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            upcomingDay.widthAnchor.constraint(equalToConstant: 150),
            
            upcomingStartTime.topAnchor.constraint(equalTo: upcomingDay.bottomAnchor, constant: 7),
            upcomingStartTime.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            
            upcomingEndTime.topAnchor.constraint(equalTo: upcomingDay.bottomAnchor, constant: 7),
            upcomingEndTime.leadingAnchor.constraint(equalTo: upcomingStartTime.trailingAnchor, constant: 3),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UpcomingResponse) {
        doctorImageView.sd_setImage(with: URL(string: model.doctor.info.profileImg))
        doctorNameText.text = model.doctor.info.name
        doctorSpecialization.text = model.doctor.doctorInfo.specialization
        upcomingDay.text = model.timeSlot.day
        upcomingStartTime.text = model.timeSlot.time.startTime + " -"
        upcomingEndTime.text = model.timeSlot.time.endTime
    }
}
