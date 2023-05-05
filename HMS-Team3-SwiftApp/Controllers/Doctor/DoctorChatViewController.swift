//
//  ChatViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 04/05/23.
//

import UIKit

class DoctorChatViewController: UIViewController {
	
	var chatTableData: ChatModel = ChatModel(Response: [ChatResponse]())
	
	private let chatTableFeed: UITableView = {
		
		let table = UITableView(frame: .zero, style: .grouped)
		table.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
		return table
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBackground
		title = "Chat"
		
		view.addSubview(chatTableFeed)
		chatTableFeed.delegate = self
		chatTableFeed.dataSource = self
		chatTableFeed.backgroundColor = .systemBackground
		fetchChatInfo()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		chatTableFeed.frame = view.bounds
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		fetchChatInfo()
	}
	
	func fetchChatInfo() {
		let doctorID = UserDefaults.standard.string(forKey: "DoctorID")!
		
		DoctorInformation.shared.getChatStatusOfUsers(completion: { results in
			switch results {
			case .success(let response):
				DispatchQueue.main.async {
					self.chatTableData = response
					self.chatTableFeed.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}, role: "doctor", id: doctorID)
	}
}

extension DoctorChatViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return chatTableData.Response.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
		cell.configureForDoctor(with: chatTableData.Response[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		var phoneNumber = chatTableData.Response[indexPath.row].patient.phoneNumber
		print(phoneNumber)
		if phoneNumber.count == 10 && phoneNumber.count < 11 {
			phoneNumber = phoneNumber.addIndianPhoneCode()
			if let messageURL = URL(string: "sms:\(phoneNumber)") {
				UIApplication.shared.open(messageURL, options: [:], completionHandler: nil)
			}
		} else {
			if let messageURL = URL(string: "sms:\(phoneNumber)") {
				UIApplication.shared.open(messageURL, options: [:], completionHandler: nil)
			}
		}
	}
}

//let messageURLString = "sms:+919449749074"
//			if let messageURL = URL(string: messageURLString) {
//				UIApplication.shared.open(messageURL, options: [:], completionHandler: nil)
//			}
