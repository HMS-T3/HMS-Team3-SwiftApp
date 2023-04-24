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


class DiscoverViewController: UIViewController, UISearchResultsUpdating {
    
    // MARK: - Creating UI Table View
    // We have used closure here to create a table view
    
    private let searchController: UISearchController  = {
       
        let search = UISearchController(searchResultsController: SearchResultsViewController())
        search.searchBar.searchBarStyle = .prominent
        return search
    }()
    
    private let discovertable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(UpcomingCollectionViewTableViewCell.self, forCellReuseIdentifier: UpcomingCollectionViewTableViewCell.identifier)
        table.register(CategoriesCollectionViewTableViewCell.self, forCellReuseIdentifier: CategoriesCollectionViewTableViewCell.identifier)
        table.register(MedicineCollectionViewTableViewCell.self, forCellReuseIdentifier: MedicineCollectionViewTableViewCell.identifier)
        table.register(PackagesCollectionViewTableViewCell.self, forCellReuseIdentifier: PackagesCollectionViewTableViewCell.identifier)

        
//      table.translatesAutoresizingMaskIntoConstraints = false
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
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        view.addSubview(discovertable)
        discovertable.delegate = self
        discovertable.dataSource = self
//      discovertable.separatorStyle = .none
        // Add the table view as a subview of the View Controller
    }
    
    // MARK: - Add table view to View Controller
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        NSLayoutConstraint.activate(
//            [
//                discovertable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                discovertable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//                discovertable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//                discovertable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//            ]
//        )
        discovertable.frame = view.bounds
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        print(text)
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
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCollectionViewTableViewCell.identifier, for: indexPath) as? CategoryCollectionViewTableViewCell else{
//            return UITableViewCell()
//        }
//        cell.backgroundColor = .blue
//        return cell
        
        switch indexPath.section {
            
        case TableSectionType.upcomingSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingCollectionViewTableViewCell.identifier, for: indexPath) as? UpcomingCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = .blue
            return cell
            
        case TableSectionType.categorySection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCollectionViewTableViewCell.identifier, for: indexPath) as? CategoriesCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = .blue
            return cell
            
        case TableSectionType.ongoingMedicationsSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCollectionViewTableViewCell.identifier, for: indexPath) as? MedicineCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = .blue
            return cell
            
        case TableSectionType.packagesSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PackagesCollectionViewTableViewCell.identifier, for: indexPath) as? PackagesCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = .blue
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                switch indexPath.section {
                case TableSectionType.upcomingSection.rawValue:
                    self.navigationController?.pushViewController(UpcomingAppointmentsViewController(), animated: true)
                case TableSectionType.categorySection.rawValue:
                    self.navigationController?.pushViewController(CategoriesCollectionViewController(), animated: true)
                case TableSectionType.ongoingMedicationsSection.rawValue:
                    self.navigationController?.pushViewController(OngoingMedicationsViewController(), animated: true)
                case TableSectionType.packagesSection.rawValue:
                    self.navigationController?.pushViewController(PackagesViewController(), animated: true)
                default:
                    tableView.deselectRow(at: indexPath, animated: true)
                }
    }
}
