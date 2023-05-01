//
//  AppleHealthViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit
import HealthKit

struct AppleHealthTabledata {
	let time: String
	var steps: String
	
	static var healthKitData: [AppleHealthTabledata] = [
		AppleHealthTabledata(time: "Day", steps: "123"),
		AppleHealthTabledata(time: "Week", steps: "890"),
		AppleHealthTabledata(time: "Month", steps: "10_000"),
		AppleHealthTabledata(time: "Year", steps: "10_00_000")
	]
}

enum appleHealthFeedSections: Int {
	case Steps = 0
}

class AppleHealthViewController: UIViewController {
	
	private let sectionTitles: [String] = ["Steps"]
	
	var healthStore: HKHealthStore? = nil
	
	private let permissionLabel: UILabel = {
	
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "You can manage permissions to share your health data from the Apple Health App"
		label.font = .italicSystemFont(ofSize: 15)
		label.numberOfLines = 2
		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .natural
		return label
	}()
	
	private let appleHealthFeed: UITableView = {
		
		let tabel = UITableView(frame: .zero, style: .plain)
		tabel.translatesAutoresizingMaskIntoConstraints = false
		tabel.register(AppleHealthTableViewCell.self, forCellReuseIdentifier: AppleHealthTableViewCell.identifier)
		tabel.showsVerticalScrollIndicator = false
		return tabel
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        
		view.backgroundColor = .systemBackground
		title = "Apple Health"

		view.addSubview(permissionLabel)
		
		view.addSubview(appleHealthFeed)
		appleHealthFeed.delegate = self
		appleHealthFeed.dataSource = self
		appleHealthFeed.backgroundColor = .systemBackground
		appleHealthFeed.separatorStyle = .none
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(refreshAppleHealthData))
		AppleHealthFunctions.shared.askForHealthKitPermission()
		refreshAppleHealthData()
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		permissionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
		permissionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		permissionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
		permissionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

		
		NSLayoutConstraint.activate(
			[
				appleHealthFeed.topAnchor.constraint(equalTo: permissionLabel.bottomAnchor, constant: 10),
				appleHealthFeed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
				appleHealthFeed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
				appleHealthFeed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			]
		)
	}
	
	@objc func refreshAppleHealthData() {
		
		AppleHealthFunctions.shared.getDailyStepsFromApple { result in
			switch result {
			case .success(let count):
				print(count)
				AppleHealthTabledata.healthKitData[0].steps = "\(count)"
			case .failure(let error):
				if error as! AppleHealthError == AppleHealthError.NoDataAvailabe {
					AppleHealthTabledata.healthKitData[0].steps = AppleHealthError.NoDataAvailabe.rawValue
				}
				
				print(error)
			}
			DispatchQueue.main.async {
				self.appleHealthFeed.reloadData()
			}
		}
		
		AppleHealthFunctions.shared.getWeeklyStepsFromApple { results in
			switch results {
			case .success(let count):
				AppleHealthTabledata.healthKitData[1].steps = "\(count)"
			case .failure(let error):
				if error as! AppleHealthError == AppleHealthError.NoDataAvailabe {
					AppleHealthTabledata.healthKitData[1].steps = AppleHealthError.NoDataAvailabe.rawValue
				}
				
				print(error)
			}
			DispatchQueue.main.async {
				self.appleHealthFeed.reloadData()
			}
		}
		
		AppleHealthFunctions.shared.getMonthlyStepsFromApple { results in
			switch results {
			case .success(let count):
				AppleHealthTabledata.healthKitData[2].steps = "\(count)"
			case .failure(let error):
				if error as! AppleHealthError == AppleHealthError.NoDataAvailabe {
					AppleHealthTabledata.healthKitData[2].steps = AppleHealthError.NoDataAvailabe.rawValue
				}
				
				print(error)
			}
			DispatchQueue.main.async {
				self.appleHealthFeed.reloadData()
			}
		}
		
		AppleHealthFunctions.shared.getYearlyStepsFromApple { results in
			switch results {
			case .success(let count):
				AppleHealthTabledata.healthKitData[3].steps = "\(count)"
			case .failure(let error):
				if error as! AppleHealthError == AppleHealthError.NoDataAvailabe {
					AppleHealthTabledata.healthKitData[3].steps = AppleHealthError.NoDataAvailabe.rawValue
				}
				
				print(error)
			}
			DispatchQueue.main.async {
				self.appleHealthFeed.reloadData()
			}
		}
	}
}

extension AppleHealthViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionTitles.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case appleHealthFeedSections.Steps.rawValue:
			return 4
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AppleHealthTableViewCell.identifier, for: indexPath) as? AppleHealthTableViewCell else { return UITableViewCell() }
		cell.configure(with: AppleHealthTabledata.healthKitData[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 110
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectionTitles[section]
	}
	
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		guard let header = view as? UITableViewHeaderFooterView else { return }
		header.textLabel?.font = .boldSystemFont(ofSize: 20)
		header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
		header.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
	}
}
