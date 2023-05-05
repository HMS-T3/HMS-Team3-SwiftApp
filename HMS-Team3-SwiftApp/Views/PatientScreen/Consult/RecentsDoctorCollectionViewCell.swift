//
//  RecentsDoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 21/04/23.
//

import UIKit

class RecentsDoctorCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecentsDoctorCollectionViewCell"
    
   
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profileImage")
//        imageView.tintColor = .label
//        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "upcoming.card")?.cgColor
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()
    
    private let iconText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "HMS3"
        textLabel.textAlignment = .left
        textLabel.font = .boldSystemFont(ofSize: 13)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(iconText)
       
        NSLayoutConstraint.activate([
                    // Image view constraints
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    // Text label constraints
            iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            iconText.centerXAnchor.constraint(equalTo: centerXAnchor),
                  
                    
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
