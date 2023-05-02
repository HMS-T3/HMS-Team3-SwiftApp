//
//  TopDoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 20/04/23.
//

import UIKit

class TopDoctorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopDoctorCollectionViewCell"
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
        textLabel.font = .boldSystemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let eduText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "MBBS"
        textLabel.textColor = .gray
        textLabel.textAlignment = .left
        textLabel.font = .boldSystemFont(ofSize: 9)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(iconText)
        addSubview(eduText)
        NSLayoutConstraint.activate([
                    // Image view constraints
                    iconImageView.topAnchor.constraint(equalTo: topAnchor),
                    iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
                    
                    // Text label constraints
                  //  iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
                    iconText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                    iconText.trailingAnchor.constraint(equalTo: trailingAnchor),
                    
                    
                    eduText.topAnchor.constraint(equalTo: iconText.bottomAnchor),
                    eduText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                    eduText.trailingAnchor.constraint(equalTo: trailingAnchor),
                    eduText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
                    
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
