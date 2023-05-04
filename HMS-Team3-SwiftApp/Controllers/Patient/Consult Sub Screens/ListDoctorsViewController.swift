//
//  ListDoctorsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 24/04/23.
//

import UIKit

class ListDoctorsViewController: UIViewController {
	
	var doctorData: SearchDoctors = SearchDoctors(Response: [SearchResponse(id: "nil", name: "nil", specialization: "nil", profileImg: "nil", gender: "nil")])
	
	private let doctorList: UITableView = {
		
		let table = UITableView(frame: .zero, style: .grouped)
		table.register(ListDoctorTableViewCell.self, forCellReuseIdentifier: ListDoctorTableViewCell.identifier)
		return table
	}()
	
	let name: String
	let filter: String
	
	init(name: String, filter: String) {
		self.name = name
		self.filter = filter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(doctorList)
		doctorList.delegate = self
		doctorList.dataSource = self
		doctorList.backgroundColor = .systemBackground
		doctorList.separatorStyle = .none
		fetchDoctorByFilter()
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		doctorList.frame = view.bounds
	}
	
	func fetchDoctorByFilter() {
		DoctorInformation.shared.getDoctorsBySearching(completion: { results in
			
			switch results {
			case .success(let response):
				DispatchQueue.main.async {
					self.doctorData = response
					self.doctorList.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}, name: "Infectious Disease Specialistss", filter: "specialization")
	}
    
}

extension ListDoctorsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return doctorData.Response.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ListDoctorTableViewCell.identifier, for: indexPath) as? ListDoctorTableViewCell else { return UITableViewCell() }
		cell.configure(with: doctorData.Response[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		self.navigationController?.pushViewController(DoctorDetailsViewController(doctorID: doctorData.Response[indexPath.row].id), animated: true)
	}
}
