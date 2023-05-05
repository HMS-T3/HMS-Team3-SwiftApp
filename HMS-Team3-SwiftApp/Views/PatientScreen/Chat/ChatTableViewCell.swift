//
//  ChatTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatTableViewCell"
	
	private let personImageView: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		image.layer.cornerRadius = 10
		image.layer.masksToBounds = true
		image.image = UIImage(systemName: "person")
		return image
	}()
	
	private let personLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Doctor Name"
		label.textAlignment = .natural
		label.font = .boldSystemFont(ofSize: 20)
		label.numberOfLines = 2
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(personImageView)
		contentView.addSubview(personLabel)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		NSLayoutConstraint.activate(
			[
				personImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
				personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
				personImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
				personImageView.widthAnchor.constraint(equalToConstant: 80),
				
				personLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
				personLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
				personLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
				personLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
			]
		)
	}
	
	public func configure(with data: ChatResponse) {
		
		personLabel.text = data.doctor.info.name
		personImageView.sd_setImage(with: URL(string: data.doctor.info.profileImg))
	}
}
