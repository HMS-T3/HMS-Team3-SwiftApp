//
//  SearchDoctorsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

import UIKit

class SearchDoctorsViewController: UIViewController {
	
	var searchArrayResults: SearchDoctors = SearchDoctors(Response: [SearchResponse]())
	
	var delegate: SearchDelegate?
	
	public let resultsTableView: UITableView = {
		
		let table = UITableView()
		table.register(ListDoctorTableViewCell.self, forCellReuseIdentifier: ListDoctorTableViewCell.identifier)
		return table
	}()

    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .systemBackground
		view.addSubview(resultsTableView)
		resultsTableView.delegate = self
		resultsTableView.dataSource = self
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		resultsTableView.frame = view.bounds
	}

}

extension SearchDoctorsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return searchArrayResults.Response.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ListDoctorTableViewCell.identifier, for: indexPath) as? ListDoctorTableViewCell else { return UITableViewCell() }
		cell.configure(with: searchArrayResults.Response[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		delegate?.goToResultsVC(indexPath: searchArrayResults.Response[indexPath.row].id)
	}
}
