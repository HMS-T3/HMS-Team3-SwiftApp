//
//  MedicineCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 26/04/23.
//

import UIKit

class MedicineCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MedicineCollectionViewCell"
    
    private let medicineImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "medicine")
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let medicineLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Medicine"
        textLabel.textColor = UIColor(named: "secondary")
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let medicineNameLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Ascoril D"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let dosageLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Dosage"
        textLabel.textColor = UIColor(named: "secondary")
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let dosageMorningLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Dosage1"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let dosageAfternoonLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Dosage2"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let dosageEveningLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Dosage3"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let separatorView1: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
//        view.frame = CGRect(x: 168, y: 88, width: 1.5, height: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
//        view.frame = CGRect(x: 228, y: 88, width: 1.5, height: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(medicineImageView)
        addSubview(medicineLabel)
        addSubview(medicineNameLabel)
        addSubview(dosageLabel)
        addSubview(dosageMorningLabel)
        addSubview(dosageAfternoonLabel)
        addSubview(dosageEveningLabel)
        addSubview(separatorView1)
        addSubview(separatorView2)
        
        NSLayoutConstraint.activate([
                    // Image view constraints
            medicineImageView.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            medicineImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            medicineImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30),
            medicineImageView.widthAnchor.constraint(equalToConstant: 80),
                    
                    // Text label constraints
            medicineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            medicineLabel.leadingAnchor.constraint(equalTo: medicineImageView.trailingAnchor, constant: 15),
            
            medicineNameLabel.topAnchor.constraint(equalTo: medicineLabel.bottomAnchor, constant: 5),
            medicineNameLabel.leadingAnchor.constraint(equalTo: medicineImageView.trailingAnchor, constant: 15),
            
            dosageLabel.topAnchor.constraint(equalTo: medicineNameLabel.bottomAnchor, constant: 10),
            dosageLabel.leadingAnchor.constraint(equalTo: medicineImageView.trailingAnchor, constant: 15),
            
            dosageMorningLabel.topAnchor.constraint(equalTo: dosageLabel.bottomAnchor, constant: 5),
            dosageMorningLabel.leadingAnchor.constraint(equalTo: medicineImageView.trailingAnchor, constant: 15),
            
            dosageAfternoonLabel.topAnchor.constraint(equalTo: dosageLabel.bottomAnchor, constant: 5),
            dosageAfternoonLabel.leadingAnchor.constraint(equalTo: dosageMorningLabel.trailingAnchor, constant: 10),
            
            separatorView1.trailingAnchor.constraint(equalTo: dosageAfternoonLabel.leadingAnchor, constant: -4),
            separatorView1.leadingAnchor.constraint(equalTo: dosageMorningLabel.trailingAnchor, constant: 5),
            separatorView1.topAnchor.constraint(equalTo: dosageLabel.bottomAnchor, constant: 7),
            separatorView1.heightAnchor.constraint(equalToConstant: 11),
            
            dosageEveningLabel.topAnchor.constraint(equalTo: dosageLabel.bottomAnchor, constant: 5),
            dosageEveningLabel.leadingAnchor.constraint(equalTo: dosageAfternoonLabel.trailingAnchor, constant: 10),
            
            separatorView2.trailingAnchor.constraint(equalTo: dosageEveningLabel.leadingAnchor, constant: -4),
            separatorView2.leadingAnchor.constraint(equalTo: dosageAfternoonLabel.trailingAnchor, constant: 5),
            separatorView2.topAnchor.constraint(equalTo: dosageLabel.bottomAnchor, constant: 7),
            separatorView2.heightAnchor.constraint(equalToConstant: 11)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: OngoingMedicineInfo){
        medicineNameLabel.text = data.name
        dosageMorningLabel.text = data.dosageMorning
        dosageAfternoonLabel.text = data.dosageAfternoon
        dosageEveningLabel.text = data.dosageEvening
    }
}
