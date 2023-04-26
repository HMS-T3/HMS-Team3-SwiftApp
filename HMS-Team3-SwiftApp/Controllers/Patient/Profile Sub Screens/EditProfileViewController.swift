//
//  EditProfileViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 21/04/23.
//

import UIKit

class EditProfileViewController: UIViewController {

	private let editTableFeed: UITableView = {
		
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		table.rowHeight = UITableView.automaticDimension
		table.estimatedRowHeight = 44
		return table
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Edit Profile"
		view.backgroundColor = .systemBackground
		view.addSubview(editTableFeed)
		editTableFeed.delegate = self
		editTableFeed.dataSource = self
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		editTableFeed.frame = view.bounds
	}
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.backgroundColor = .gray
		return cell
	}
}
