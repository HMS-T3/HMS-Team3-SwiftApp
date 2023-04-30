//
//  DIscoverViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 20/04/23.
//
import UIKit

enum TableSectionType : Int {
    case upcomingSection = 0
    case ongoingMedicationsSection = 1
    case categorySection = 2
    case packagesSection = 3
}

class DiscoverViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDelegate {
    
    // MARK: - Creating UI Table View
    // We have used closure here to create a table view
    var specializations : [Specialization] = [Specialization(specialization: "Dentist", description: "haha", imgUrl: "https://res.cloudinary.com/dujgzpuyd/image/upload/v1682661888/pills.fill_xzzoki.svg")]
    
    private let searchController: UISearchController  = {
       
        let search = UISearchController(searchResultsController: SearchResultsViewController())
        search.searchBar.searchBarStyle = .prominent
        return search
    }()
    
    private let discovertable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = UIColor(named: "hometab.background")
        table.register(UpcomingCollectionViewTableViewCell.self, forCellReuseIdentifier: UpcomingCollectionViewTableViewCell.identifier)
        table.register(MedicineCollectionViewTableViewCell.self, forCellReuseIdentifier: MedicineCollectionViewTableViewCell.identifier)
        table.register(CategoriesCollectionViewTableViewCell.self, forCellReuseIdentifier: CategoriesCollectionViewTableViewCell.identifier)
        table.register(PackagesCollectionViewTableViewCell.self, forCellReuseIdentifier: PackagesCollectionViewTableViewCell.identifier)

        
//      table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    private let tableSectionTitle: [String] = ["Upcoming Appointments", "Ongoing Medication", "Categories", "Packages"]

    override func viewDidLoad() {
        super.viewDidLoad()
        GetDoctorSpecialization.shared.getDoctorSpecialization(completion: { results in
            switch results {
            case .success(let categories):
                print("Success")
                DispatchQueue.main.async {
                    self.specializations = categories.Specialization
                    self.discovertable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
        print("hello")
        print(specializations)
        view.backgroundColor = .systemBackground
        title = "Discover"
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
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
        discovertable.frame = view.bounds
    }
//    func updateSpecializations(_ categories: [Specialization]){
//        specializations = categories
//    }
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case TableSectionType.upcomingSection.rawValue:
            return tableSectionTitle[section]
        case TableSectionType.ongoingMedicationsSection.rawValue:
            return tableSectionTitle[section]
        case TableSectionType.categorySection.rawValue:
            return tableSectionTitle[section]
        case TableSectionType.packagesSection.rawValue:
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
        header.textLabel?.text =  header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        switch indexPath.section {
            
        case TableSectionType.upcomingSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingCollectionViewTableViewCell.identifier, for: indexPath) as? UpcomingCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
            
        case TableSectionType.ongoingMedicationsSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCollectionViewTableViewCell.identifier, for: indexPath) as? MedicineCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        
        case TableSectionType.categorySection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCollectionViewTableViewCell.identifier, for: indexPath) as? CategoriesCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
            cell.configureCategory(specializations)
            print("hi")
            return cell
            
        case TableSectionType.packagesSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PackagesCollectionViewTableViewCell.identifier, for: indexPath) as? PackagesCollectionViewTableViewCell else{
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
            case TableSectionType.upcomingSection.rawValue:
                return 220
            case TableSectionType.ongoingMedicationsSection.rawValue:
                return 170
            case TableSectionType.categorySection.rawValue:
                return 220
            case TableSectionType.packagesSection.rawValue:
                return 230
            default:
                return 0
            
        }
    }
}

extension DiscoverViewController: ClickCollectionViewDelegate {
 
    func clickedOnUpcomingCell() {
        self.navigationController?.pushViewController(UpcomingAppointmentsViewController(), animated: true)
    }
    
    func clickedOnMedicationsCell() {
        self.navigationController?.pushViewController(OngoingMedicationsViewController(), animated: true)
    }
    
    func clickedOnCategoryCell() {
        self.navigationController?.pushViewController(CategoriesCollectionViewController(), animated: true)
    }
    
    func clickedOnPackagesCell() {
        self.navigationController?.pushViewController(PackagesViewController(), animated: true)
    }
}
