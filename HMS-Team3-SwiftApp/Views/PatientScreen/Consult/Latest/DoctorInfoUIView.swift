//
//  DoctorInfoUIView.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//
import UIKit
import SDWebImage

class DoctorInfoUIView: UIView {
    
    var doctorInfo: DoctorDetails
    
    private let doctorImageView: UIImageView  = {
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.image = UIImage(systemName: "person")
        image.backgroundColor = .red
        return image
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Name"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let qualificationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Qualification of the dooctor"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    init(frame: CGRect, info: DoctorDetails) {
        self.doctorInfo = info
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(doctorImageView)
        addSubview(nameLabel)
        addSubview(qualificationLabel)
        
		nameLabel.text = doctorInfo.Response.info.name
		qualificationLabel.text = doctorInfo.Response.doctorInfo.specialization
		doctorImageView.sd_setImage(with: URL(string: doctorInfo.Response.info.profileImg))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
				doctorImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
                doctorImageView.widthAnchor.constraint(equalToConstant: 150),
                doctorImageView.heightAnchor.constraint(equalToConstant: 150),
                doctorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                nameLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
                nameLabel.topAnchor.constraint(equalTo: doctorImageView.topAnchor, constant: 5),
                nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                
                qualificationLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
                qualificationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                qualificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ]
        )
    }
    
}
