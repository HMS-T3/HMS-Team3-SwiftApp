//
//  TestCategoriesCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 30/04/23.
//

import UIKit

class TestCategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "TestCategoriesCollectionViewCell"
    
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "Covid19")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        imageView.layer.shadowOpacity = 0.5
//        imageView.layer.shadowRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()
    
    private let iconText: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Covid 19"
//        textLabel.backgroundColor = .green
        textLabel.textAlignment = .center
        textLabel.font = .boldSystemFont(ofSize: 10)
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
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Text label constraints
            iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            iconText.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconText.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconText.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

