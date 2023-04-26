//
//  QuickStatsCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit

class QuickStatsCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "QuickStatsCollectionViewCell"
	
	private let iconImageView: UIImageView = {
		
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
		image.tintColor = .label
		image.translatesAutoresizingMaskIntoConstraints = false
		let config = UIImage.SymbolConfiguration(scale: .small)
		image.preferredSymbolConfiguration = config
		return image
	}()
	
	private let mainLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let userInputLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 17, weight: .bold)
		label.numberOfLines = 1
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.addSubview(iconImageView)
		contentView.addSubview(mainLabel)
		contentView.addSubview(userInputLabel)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		NSLayoutConstraint.activate(
			[
				iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
				iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
				iconImageView.heightAnchor.constraint(equalToConstant: 40),
				iconImageView.widthAnchor.constraint(equalToConstant: 40),
				
				mainLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15),
				mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
				mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
				
				userInputLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
				userInputLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
				userInputLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
			]
		)
	}
	
	public func configure(with data: QuickStatsStaticInfo) {
		iconImageView.image = UIImage(systemName: data.imageSystemName)
		mainLabel.text = data.mainLabel
		userInputLabel.text = data.userInputLabel
		iconImageView.tintColor = UIColor(named: data.labelColorName)
	}
	
}
