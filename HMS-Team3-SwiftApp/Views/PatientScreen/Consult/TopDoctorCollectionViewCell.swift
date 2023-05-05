//
//  TopDoctorCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 20/04/23.
//

import UIKit
import SDWebImage

class TopDoctorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopDoctorCollectionViewCell"
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
        imageView.backgroundColor = .orange
		imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let iconText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "HMS3"
        textLabel.textAlignment = .left
        textLabel.font = .boldSystemFont(ofSize: 17)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let eduText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "MBBS"
        textLabel.textColor = .gray
        textLabel.textAlignment = .left
        textLabel.font = .boldSystemFont(ofSize: 12)
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
                    iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//                    iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    iconImageView.heightAnchor.constraint(equalToConstant: 80),
                    iconImageView.widthAnchor.constraint(equalToConstant: 80),
                    iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                    // Text label constraints
                  //  iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
                    iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15),
                    iconText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                    iconText.trailingAnchor.constraint(equalTo: trailingAnchor),
                    
                    
                    eduText.topAnchor.constraint(equalTo: iconText.bottomAnchor, constant: 4),
                    eduText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                    eduText.trailingAnchor.constraint(equalTo: trailingAnchor),
//                    eduText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
                    
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	public func configure(with data: SearchResponse) {
		iconImageView.sd_setImage(with: URL(string: data.profileImg))
		iconText.text = data.name
		eduText.text = data.specialization
	}
    
}
