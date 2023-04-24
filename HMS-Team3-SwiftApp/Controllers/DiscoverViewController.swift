//
//  DIscoverViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 20/04/23.
//

import UIKit

enum TableSectionType : Int {
    case upcomingSection = 0
    case categorySection = 1
    case ongoingMedicationsSection = 2
    case packagesSection = 3
}


class DiscoverViewController: UIViewController {

    // MARK: - Creating UI Table View
    // We have used closure here to create a table view
    
    private let discovertable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    private let tableSectionTitle: [String] = ["Upcoming Appointments","Category", "Ongoing Medication", "Packages"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Discover"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(discovertable)
        discovertable.delegate = self
        discovertable.dataSource = self
//        discovertable.separatorStyle = .none
        // Add the table view as a subview of the View Controller
    }
    
    // MARK: - Add table view to View Controller
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate(
            [
                discovertable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                discovertable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                discovertable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                discovertable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }

}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSectionTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        cell.backgroundColor = .blue
        return cell  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
