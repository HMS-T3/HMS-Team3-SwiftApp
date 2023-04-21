//
//  ProfileTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 19/04/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
	
	static let identifier = "ProfileTableViewCell"
	
	private let imageIcon: UIImageView = {
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
//		image.image = UIImage(systemName: "cross.case.fill")
		image.tintColor = .label
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	private let mainLabel: UILabel = {
		
		let label = UILabel()
//		label.text = "Medical History"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 22, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let subLabel: UILabel = {
		
		let label = UILabel()
//		label.text = "Check all your medical History"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	
	private let arrowImage: UIImageView = {
		
		let image = UIImageView()
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		let config = UIImage.SymbolConfiguration(scale: .medium)
		image.image = UIImage(systemName: "chevron.right", withConfiguration: config)
		image.tintColor = .secondaryLabel
		return image
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(imageIcon)
		contentView.addSubview(mainLabel)
		contentView.addSubview(subLabel)
		contentView.addSubview(arrowImage)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		NSLayoutConstraint.activate(
			[
				imageIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
				imageIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
				imageIcon.heightAnchor.constraint(equalToConstant: 30),
				imageIcon.widthAnchor.constraint(equalToConstant: 30),
				
				arrowImage.heightAnchor.constraint(equalToConstant: 30),
				arrowImage.widthAnchor.constraint(equalToConstant: 25),
				arrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
				
				mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
				mainLabel.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 15),
				mainLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -20),
				mainLabel.heightAnchor.constraint(equalToConstant: 30),
				
				subLabel.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: 10),
				subLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
				subLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
				subLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -20)
			]
		)
	}
	
	public func configure(with data: ProfileStaticInfo) {
		imageIcon.image = UIImage(systemName: data.imageSystemName)
		mainLabel.text = data.mainLabelText
		subLabel.text = data.subLabelText
	}
	
}
