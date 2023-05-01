//
//  CategoryCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 19/04/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategoryCollectionViewCell"
    
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Covid19")
//        imageView.tintColor = .label
//        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "upcoming.card")?.cgColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()
    
    private let iconText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "HMS3"
        textLabel.textAlignment = .center
        textLabel.textColor = .gray
        textLabel.font = .boldSystemFont(ofSize: 9)
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
                  
                    iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor,constant: 10),
                    iconText.leadingAnchor.constraint(equalTo: leadingAnchor),
                    iconText.trailingAnchor.constraint(equalTo: trailingAnchor),
                    iconText.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: Categories) {
        iconImageView.image = data.categoryImage
        iconText.text = data.categoryName.rawValue
        }

}
