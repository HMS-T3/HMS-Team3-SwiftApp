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
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOpacity = 0.5
//        imageView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        imageView.layer.shadowRadius = 2.0
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let doctorNameText: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "Doc Name"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let doctorSpecialization: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.text = "Doc Specialization"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(doctorImageView)
        addSubview(doctorNameText)
        addSubview(doctorSpecialization)
        NSLayoutConstraint.activate([
                    // Image view constraints
            doctorImageView.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            doctorImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            doctorImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30),
            doctorImageView.widthAnchor.constraint(equalToConstant: 90),
                    
                    // Text label constraints
            doctorNameText.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            doctorNameText.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            
            doctorSpecialization.topAnchor.constraint(equalTo: doctorNameText.bottomAnchor, constant: 10),
            doctorSpecialization.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: DocInfo) {
        doctorImageView.image = data.docImage
        doctorNameText.text = data.docName
        doctorSpecialization.text = data.docSpecialization
    }
}
