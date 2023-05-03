//
//  ConsultViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 19/04/23.
//


import UIKit
import Foundation

enum ConsultTableSectionType : Int {
    case categorySection = 0
    case topDocSection = 1
    case recentDocSection = 2
    
}
protocol ConsultTabDelegate {
    func clickedCategory()
    func clickedTopDoc()
    func clickedRecent()
}

class ConsultViewController: UIViewController, UISearchResultsUpdating {
    
    
    private let searchController: UISearchController  = {
       
        let search = UISearchController(searchResultsController: SearchResultsViewController())
        search.searchBar.searchBarStyle = .prominent
        return search
    }()
    
    private let discovertable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .white
        table.register(CatTableViewCell.self, forCellReuseIdentifier: CatTableViewCell.identifier)
        table.register(TopDocTableViewCell.self, forCellReuseIdentifier: TopDocTableViewCell.identifier)
        table.register(RecentTableViewCell.self, forCellReuseIdentifier: RecentTableViewCell.identifier)

        
//      table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    private let tableSectionTitle: [String] = ["Categories", "Top Doctors", "Recent Doctors"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        discovertable.backgroundColor = .white
        title = "Find Doctors"
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self

        view.addSubview(discovertable)
        discovertable.delegate = self
        discovertable.dataSource = self
        discovertable.separatorStyle = .none
        // Add the table view as a subview of the View Controller
    }
    
    // MARK: - Add table view to View Controller
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discovertable.frame = view.bounds
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        print(text)
    }
    
}

extension ConsultViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSectionTitle.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
       
        case ConsultTableSectionType.categorySection.rawValue:
            return tableSectionTitle[section]
        case ConsultTableSectionType.topDocSection.rawValue:
            return tableSectionTitle[section]
        case ConsultTableSectionType.recentDocSection.rawValue:
            return tableSectionTitle[section]
        default:
            return "No Section Title"
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.frame.size.width = tableView.bounds.width
        header.textLabel?.textColor = .black
        header.textLabel?.font = .boldSystemFont(ofSize: 20)
        header.textLabel?.frame = header.bounds
        header.layer.backgroundColor = UIColor.white.cgColor
        header.textLabel?.text =  header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        switch indexPath.section {
            
        case ConsultTableSectionType.categorySection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatTableViewCell.identifier, for: indexPath) as? CatTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
            
        case ConsultTableSectionType.topDocSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopDocTableViewCell.identifier, for: indexPath) as? TopDocTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
            
        case ConsultTableSectionType.recentDocSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.identifier, for: indexPath) as? RecentTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
     
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
            case ConsultTableSectionType.categorySection.rawValue:
                return 220
            case ConsultTableSectionType.topDocSection.rawValue:
                return 150
            case ConsultTableSectionType.recentDocSection.rawValue:
                return 140
            default:
                return 0
            
        }
    }
}

extension ConsultViewController: ConsultTabDelegate {
    func clickedCategory() {
        let controller = storyboard?.instantiateViewController(identifier: "ListDoctorsViewController")
        navigationController?.pushViewController(controller!, animated: true)
    }
    
    func clickedTopDoc() {
        let controller = storyboard?.instantiateViewController(identifier: "DoctorDetailsViewController")
        navigationController?.pushViewController(controller!, animated: true)
    }
    
    func clickedRecent() {
        let controller = storyboard?.instantiateViewController(identifier: "DoctorDetailsViewController")
        navigationController?.pushViewController(controller!, animated: true)
    }
    
 
}
