//
//  PackagesCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 26/04/23.
//

import UIKit

class PackagesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PackagesCollectionViewCell"
    
    private let packagesImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "doctor.male.2")
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imageView.layer.borderWidth = 2.0
//        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let packagesLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Book your complete health check-up package now!!"
        textLabel.textColor = .label
        textLabel.numberOfLines = 0 // For no limits on number of lines, set this to 0.
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let packagesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Learn More", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(named: "secondary")
        print(button)
        button.layer.cornerRadius = 5
        button.isHidden = false
        button.frame = CGRect(x: 30, y: 110, width: 100, height: 30)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(packagesLabel)
        addSubview(packagesButton)
        addSubview(packagesImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([

            // TextLabel constraints
            packagesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            packagesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            packagesLabel.trailingAnchor.constraint(equalTo: packagesImageView.leadingAnchor, constant: -30),

            // ImageView constraints
            packagesImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            packagesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: PackageInfo){
        packagesImageView.image = data.image
        packagesLabel.text = data.text
        packagesButton.setTitle("\(data.buttonText)", for: .normal)
    }
}
