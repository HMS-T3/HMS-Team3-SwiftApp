//
//  CategoriesCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 25/04/23.
//

import UIKit
import SDWebImage

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //        imageView.tintColor = .label
        //        imageView.layer.borderWidth = 1
        //        imageView.layer.borderColor = UIColor(named: "upcoming.card")?.cgColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()
    
    private let iconText: UILabel = {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.clipsToBounds = true
        textLabel.numberOfLines = 2
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
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 65),
            iconImageView.heightAnchor.constraint(equalToConstant: 65),
            
            // Text label constraints
            
            iconText.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            iconText.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            iconText.widthAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: Categories) {
        //        iconImageView.sd_setImage(with: URL(string: (data.categoryImage) ?? ""))
        iconImageView.image = data.categoryImage
        iconText.text = data.categoryName?.rawValue
    }
}
