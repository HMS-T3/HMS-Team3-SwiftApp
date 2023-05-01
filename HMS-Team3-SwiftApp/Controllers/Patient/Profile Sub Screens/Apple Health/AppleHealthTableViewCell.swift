//
//  AppleHealthTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 29/04/23.
//

import UIKit

class AppleHealthTableViewCell: UITableViewCell {

    static let identifier = "AppleHealthTableViewCell"
	
	private let backgroundCellView: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor(named: "ProfileAppleHealth")
		view.layer.cornerRadius = 10
		view.layer.masksToBounds = true
		return view
	}()
	
	private let timeLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Year"
		label.font = .italicSystemFont(ofSize: 55)
		return label
	}()
	
	private let stepsCountLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "3304"
		label.font = .boldSystemFont(ofSize: 40)
		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .right
		label.numberOfLines = 2
		return label
	}()
	
	private let stepsTextLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Steps"
		label.font = .systemFont(ofSize: 25)
		label.textAlignment = .right
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(backgroundCellView)
		contentView.addSubview(timeLabel)
		contentView.addSubview(stepsTextLabel)
		contentView.addSubview(stepsCountLabel)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		NSLayoutConstraint.activate(
			[
				backgroundCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
				backgroundCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
				backgroundCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
				backgroundCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
				
				timeLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 5),
				timeLabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 5),
				timeLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -5),
				
				stepsTextLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -5),
				stepsTextLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -5),
				
				stepsCountLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 10),
				stepsCountLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -5),
				stepsCountLabel.bottomAnchor.constraint(equalTo: stepsTextLabel.topAnchor, constant: -5),
				stepsCountLabel.widthAnchor.constraint(equalToConstant: 150)
			]
		)
	}
	
	public func configure(with data: AppleHealthTabledata) {
		
		timeLabel.text = data.time
		stepsCountLabel.text = data.steps
	}
	
}
