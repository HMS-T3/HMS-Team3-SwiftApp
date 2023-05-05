//
//  TopSellingCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 30/04/23.
//

import UIKit

class TopSellingCollectionViewCell: UICollectionViewCell {
    static let identifier = "TopSellingCollectionViewCell"
    
    private let topSellingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "blood.donation")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()
    
    private let topSellingTitle: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Complete Blood Count (CBC)"
        textLabel.textColor = .white
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel.font = .boldSystemFont(ofSize: 13)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let topSellingLabel1: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "15 tests included"
        textLabel.textAlignment = .left
        textLabel.textColor = .white
        textLabel.font = .boldSystemFont(ofSize: 11)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let topSellingSeparatorUIVIew: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let amountLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .white
        textLabel.font = .boldSystemFont(ofSize: 12)
        textLabel.text = "MRP : ₹ 469"
        return textLabel
    }()
    
    private let cartLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .white
        textLabel.text = "Add To Cart"
        textLabel.font = .boldSystemFont(ofSize: 13)
        return textLabel
    }()
    
    private let cartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "cart")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .small)
        imageView.preferredSymbolConfiguration = config
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topSellingImageView)
        addSubview(topSellingTitle)
        addSubview(topSellingLabel1)
        addSubview(topSellingSeparatorUIVIew)
        addSubview(amountLabel)
        addSubview(cartLabel)
        addSubview(cartImage)
        NSLayoutConstraint.activate([
            // Image view constraints
            topSellingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            topSellingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            topSellingImageView.heightAnchor.constraint(equalToConstant: 25),
            topSellingImageView.widthAnchor.constraint(equalToConstant: 25),
            
            cartImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cartImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cartImage.heightAnchor.constraint(equalToConstant: 25),
            cartImage.widthAnchor.constraint(equalToConstant: 25),
            
            // Text label constraints
            topSellingTitle.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            topSellingTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            topSellingTitle.widthAnchor.constraint(equalToConstant: 110),
            
            topSellingLabel1.topAnchor.constraint(equalTo: topSellingTitle.bottomAnchor, constant: 10),
            topSellingLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            topSellingLabel1.widthAnchor.constraint(equalToConstant: 100),
            
            topSellingSeparatorUIVIew.topAnchor.constraint(equalTo: topSellingLabel1.bottomAnchor, constant: 8),
            topSellingSeparatorUIVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            topSellingSeparatorUIVIew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            topSellingSeparatorUIVIew.heightAnchor.constraint(equalToConstant: 0.5),
            
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            amountLabel.topAnchor.constraint(equalTo: topSellingSeparatorUIVIew.bottomAnchor, constant: 10),
            
            cartLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cartLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
            
            

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    
