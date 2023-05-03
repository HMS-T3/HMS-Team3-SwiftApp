//
//  AboutDoctorTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 01/05/23.
//
import UIKit
class AboutDoctorTableViewCell: UITableViewCell {
    
    static let identifier = "AboutDoctorTableViewCell"
    
    private let aboutLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .natural
        label.numberOfLines = 1
        return label
    }()
    
    private let aboutTextView: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .natural
        label.numberOfLines = 3
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(aboutLabel)
        contentView.addSubview(aboutTextView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                aboutLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                
                aboutTextView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 10),
                aboutTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                aboutTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                aboutTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ]
        )
    }
    
    public func configure(text: String) {
        
        self.aboutTextView.text = text
        layoutSubviews()
    }
    
    public func fullTextView() {
        self.aboutTextView.numberOfLines = 0
        layoutSubviews()
    }
}
