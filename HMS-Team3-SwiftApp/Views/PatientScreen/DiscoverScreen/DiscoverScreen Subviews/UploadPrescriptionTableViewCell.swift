//
//  UploadPrescriptionTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 30/04/23.
//
import UIKit
import UniformTypeIdentifiers

class UploadPrescriptionTableViewCell: UITableViewCell {
    
    static let identifier =  "UploadPrescriptionTableViewCell"
    
    let paddingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        return view
    }()
    
    let prescriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "upload.prescription")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let uploadPrescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Upload Prescription"
        //        label.backgroundColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let uploadPrescriptionSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Place order with prescription"
        label.textColor = UIColor(named: "secondary")
        label.numberOfLines = 0
        //        label.backgroundColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    let uploadPrescriptionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.opacity = 0.75
        button.layer.cornerRadius = 5
        button.tintColor = UIColor.black
        button.setImage(UIImage(systemName: "arrow.up.to.line"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "gray.shadow")
        
        contentView.addSubview(paddingView)
        paddingView.addSubview(prescriptionImageView)
        paddingView.addSubview(uploadPrescriptionLabel)
        paddingView.addSubview(uploadPrescriptionSubLabel)
        paddingView.addSubview(uploadPrescriptionButton)
        
        NSLayoutConstraint.activate([
            
            paddingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            paddingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            prescriptionImageView.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 0),
            prescriptionImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 0),
            prescriptionImageView.widthAnchor.constraint(equalToConstant: 80),
            prescriptionImageView.heightAnchor.constraint(equalToConstant: 80),
            
            uploadPrescriptionLabel.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 17),
            uploadPrescriptionLabel.leadingAnchor.constraint(equalTo: prescriptionImageView.trailingAnchor, constant: 10),
            uploadPrescriptionLabel.widthAnchor.constraint(equalToConstant: 150),
            
            uploadPrescriptionSubLabel.topAnchor.constraint(equalTo: uploadPrescriptionLabel.bottomAnchor, constant: 8),
            uploadPrescriptionSubLabel.leadingAnchor.constraint(equalTo: prescriptionImageView.trailingAnchor, constant: 10),
            uploadPrescriptionSubLabel.widthAnchor.constraint(equalToConstant: 200),
            
            uploadPrescriptionButton.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 25),
            uploadPrescriptionButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -20),
            uploadPrescriptionButton.widthAnchor.constraint(equalToConstant: 30),
            uploadPrescriptionButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
        uploadPrescriptionButton.addTarget(self, action: #selector(uploadPressed), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func uploadPressed() {
        print(#function)
    }
}
