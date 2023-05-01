//
//  ProfileHeaderUIView.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 19/04/23.
//

import UIKit
import SDWebImage
class ProfileHeaderUIView: UIView {
	
	let delegate: ProfileHeaderUIViewDelegate
	
	let profileDetails: UserResponse
	
	private let profileInfoView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor(named: "ProfileHeader")
		view.layer.cornerRadius = 10
		view.layer.masksToBounds = true
		return view
	}()
	
	private let editButton: UIButton = {
		
		let button = UIButton()
		button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
		button.tintColor = UIColor(named: "iconColors")
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private let profileImage: UIImageView = {
		
		let image = UIImageView()
		// image.image = UIImage(named: "profileImage")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		return image
	}()
	
	private let nameLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Name of the Patient"
		label.font = .systemFont(ofSize: 22, weight: .regular)
		label.numberOfLines = 2
		return label
	}()
	
	private let dobIcon: UIImageView = {
		
		let image = UIImageView()
		image.image = UIImage(systemName: "calendar")
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = UIColor(named: "iconColors")
		return image
	}()
	
	private let dobLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.numberOfLines = 1
		label.text = "Sample"
		return label
	}()
	
	private let genderIcon: UIImageView = {

		let image = UIImageView()
		image.image = UIImage(systemName: "person.crop.circle.fill")
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = UIColor(named: "iconColors")
		return image
	}()
	
	private let genderLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.numberOfLines = 1
		label.text = "Sample"
		return label
	}()
	
	private let phoneNumberIcon: UIImageView = {

		let image = UIImageView()
		image.image = UIImage(systemName: "iphone")
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = UIColor(named: "iconColors")
		return image
	}()
	
	private let phoneNumberLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.numberOfLines = 1
		label.text = "Sample"
		return label
	}()

	init(frame: CGRect, delegate: ProfileHeaderUIViewDelegate, profileDetails: UserResponse) {
		self.delegate = delegate
		self.profileDetails = profileDetails
		super.init(frame: frame)
		
		addSubview(profileInfoView)
		
		addSubview(profileImage)
		addSubview(editButton)
		editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
		
		addSubview(nameLabel)
		
		addSubview(dobIcon)
		addSubview(dobLabel)
		
		addSubview(genderIcon)
		addSubview(genderLabel)
		
		addSubview(phoneNumberIcon)
		addSubview(phoneNumberLabel)
		
		fetchPatientDetails()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		NSLayoutConstraint.activate(
			[
				profileInfoView.topAnchor.constraint(equalTo: topAnchor),
				profileInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
				profileInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
				profileInfoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
				
				editButton.topAnchor.constraint(equalTo: profileInfoView.topAnchor, constant: 10),
				editButton.trailingAnchor.constraint(equalTo: profileInfoView.trailingAnchor, constant: -10),
				editButton.widthAnchor.constraint(equalToConstant: 20),
				editButton.heightAnchor.constraint(equalToConstant: 20),
				
				profileImage.centerYAnchor.constraint(equalTo: profileInfoView.centerYAnchor),
				profileImage.leadingAnchor.constraint(equalTo: profileInfoView.leadingAnchor, constant: 10),
				profileImage.widthAnchor.constraint(equalToConstant: 90),
				profileImage.heightAnchor.constraint(equalToConstant: 90),
				
				nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
				nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
				nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
				
				dobIcon.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
				dobIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
				dobIcon.widthAnchor.constraint(equalToConstant: 20),
				dobIcon.heightAnchor.constraint(equalToConstant: 20),
				
				dobLabel.leadingAnchor.constraint(equalTo: dobIcon.trailingAnchor, constant: 10),
				dobLabel.heightAnchor.constraint(equalToConstant: 20),
				dobLabel.trailingAnchor.constraint(equalTo: profileInfoView.trailingAnchor, constant: -10),
				dobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
				
				genderIcon.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
				genderIcon.topAnchor.constraint(equalTo: dobIcon.bottomAnchor, constant: 10),
				genderIcon.widthAnchor.constraint(equalToConstant: 20),
				genderIcon.heightAnchor.constraint(equalToConstant: 20),
				
				genderLabel.leadingAnchor.constraint(equalTo: genderIcon.trailingAnchor, constant: 10),
				genderLabel.heightAnchor.constraint(equalToConstant: 20),
				genderLabel.trailingAnchor.constraint(equalTo: profileInfoView.trailingAnchor, constant: -10),
				genderLabel.topAnchor.constraint(equalTo: dobIcon.bottomAnchor, constant: 10),
				
				phoneNumberIcon.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
				phoneNumberIcon.topAnchor.constraint(equalTo: genderIcon.bottomAnchor, constant: 10),
				phoneNumberIcon.widthAnchor.constraint(equalToConstant: 20),
				phoneNumberIcon.heightAnchor.constraint(equalToConstant: 20),
				
				phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberIcon.trailingAnchor, constant: 10),
				phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
				phoneNumberLabel.trailingAnchor.constraint(equalTo: profileInfoView.trailingAnchor, constant: -10),
				phoneNumberLabel.topAnchor.constraint(equalTo: genderIcon.bottomAnchor, constant: 10)
			]
		)
		profileImage.layer.cornerRadius = 45
		profileImage.layer.masksToBounds = true
	}
	
	func fetchPatientDetails() {
		
		let dateFormatter = DateFormatter()
		dateFormatter.setLocalizedDateFormatFromTemplate("d MMM yyyy")
        nameLabel.text = "\(profileDetails.info?.name! ?? "Name")"
        dobLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: 213219838))
        genderLabel.text = "Female"
        profileImage.sd_setImage(with: URL(string: (profileDetails.info?.profileImg) ?? ""))
        phoneNumberLabel.text = "\(profileDetails.phoneNumber ?? "1213445")"
	}
	
	@objc func editButtonPressed() {
		delegate.clickedOnEditButton()
	}
	
}
