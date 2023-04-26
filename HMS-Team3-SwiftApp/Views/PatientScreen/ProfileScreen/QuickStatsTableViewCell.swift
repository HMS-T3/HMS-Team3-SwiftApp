//
//  QuickStatsTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit

struct QuickStatsStaticInfo {
	let imageSystemName: String
	let mainLabel: String
	let userInputLabel: String
	let labelColorName: String
	
	static let quickStatsData: [QuickStatsStaticInfo] = [
		QuickStatsStaticInfo(imageSystemName: "dumbbell",
							 mainLabel: "Weight",
							 userInputLabel: "180 lbs",
							 labelColorName: "weight"),
		
		QuickStatsStaticInfo(imageSystemName: "drop.fill",
							 mainLabel: "Blood Group",
							 userInputLabel: "B +ve",
							 labelColorName: "blood"),
		
		QuickStatsStaticInfo(imageSystemName: "chart.xyaxis.line",
							 mainLabel: "Heart Rate",
							 userInputLabel: "78 rpm",
							 labelColorName: "heartRate")
	]
}

enum QuickStats: Int {
	case Weight = 0
	case BloodGroup = 1
	case HeartRate = 2
}

class QuickStatsTableViewCell: UITableViewCell {

    static let identifier = "QuickStatsTableViewCell"
	
	private let statsCollectionView: UICollectionView = {
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 130, height: 130)
		
		let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.register(QuickStatsCollectionViewCell.self, forCellWithReuseIdentifier: QuickStatsCollectionViewCell.identifier)
		view.showsHorizontalScrollIndicator = false
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(statsCollectionView)
		statsCollectionView.delegate = self
		statsCollectionView.dataSource = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		statsCollectionView.frame = contentView.bounds
		statsCollectionView.backgroundColor = UIColor(named: "ProfileBackground")
	}
}

extension QuickStatsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return QuickStatsStaticInfo.quickStatsData.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickStatsCollectionViewCell.identifier, for: indexPath) as? QuickStatsCollectionViewCell else { return UICollectionViewCell() }
		switch indexPath.row {
		case 0:
			cell.backgroundColor = UIColor(named: "stats1")
		case 1:
			cell.backgroundColor = UIColor(named: "stats2")
		case 2:
			cell.backgroundColor = UIColor(named: "stats3")
		default:
			cell.backgroundColor = .gray
		}
		cell.layer.cornerRadius = 10
		cell.configure(with: QuickStatsStaticInfo.quickStatsData[indexPath.row])
		return cell
	}
}
