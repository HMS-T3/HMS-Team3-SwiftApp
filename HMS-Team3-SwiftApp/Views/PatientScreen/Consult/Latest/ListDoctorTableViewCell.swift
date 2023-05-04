//
//  ListDoctorTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

import UIKit
import SDWebImage

class ListDoctorTableViewCell: UITableViewCell {

    static let identifier = "ListDoctorTableViewCell"
	
	let cellView: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(named: "border")?.cgColor
		view.backgroundColor = .systemBackground
		return view
	}()
	
	private let doctorImageView: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		image.layer.cornerRadius = 10
		image.layer.masksToBounds = true
		image.image = UIImage(systemName: "person")
		return image
	}()
	
	private let doctorNameLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .boldSystemFont(ofSize: 20)
		label.numberOfLines = 2
		label.textColor = .label
		label.text = "Doctor"
		return label
	}()
	
	private let doctorSpecialityLabel: UITextView = {
		
		let label = UITextView()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 18)
		label.textColor = .darkGray
		label.text = "Heart"
		label.textAlignment = .natural
		label.textContainerInset = .zero
		label.textContainer.lineFragmentPadding = .zero
		label.contentMode = .topLeft
		label.isEditable = false
		return label
	}()
	
	private let clearView: UIView = {
		
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(cellView)
		contentView.addSubview(doctorImageView)
		contentView.addSubview(doctorNameLabel)
		contentView.addSubview(doctorSpecialityLabel)
		contentView.addSubview(clearView)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		clearView.frame = contentView.bounds
		
		NSLayoutConstraint.activate(
			[
				cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
				cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
				cellView.heightAnchor.constraint(equalToConstant: contentView.bounds.height - 10),
				cellView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
				cellView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				
				doctorImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
				doctorImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
				doctorImageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
				doctorImageView.widthAnchor.constraint(equalToConstant: 110),
				
				doctorNameLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
				doctorNameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
				doctorNameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
				
				doctorSpecialityLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 5),
				doctorSpecialityLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
				doctorSpecialityLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
				doctorSpecialityLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10)
			]
		)
	}
	
	public func configure(with data: SearchResponse) {
		
		doctorImageView.sd_setImage(with: URL(string: data.profileImg))
		doctorNameLabel.text = data.name
		doctorSpecialityLabel.text = data.specialization
	}

}
