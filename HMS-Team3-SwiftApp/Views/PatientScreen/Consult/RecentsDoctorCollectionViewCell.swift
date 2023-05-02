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
        imageView.image = UIImage(named: "Covid19")
//        imageView.tintColor = .label
//        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "upcoming.card")?.cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
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
                    iconImageView.topAnchor.constraint(equalTo: topAnchor),
                    iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
                    
                    // Text label constraints
                    iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
                    iconText.leadingAnchor.constraint(equalTo: leadingAnchor),
                    iconText.trailingAnchor.constraint(equalTo: trailingAnchor),
                  
                    
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
