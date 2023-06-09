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

class DiscoverViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Creating UI Table View
    // We have used closure here to create a table view
    var specializations : [Specialization] = [Specialization(specialization: "Dentist", description: "haha", imgUrl: "https://res.cloudinary.com/dujgzpuyd/image/upload/v1682661888/pills.fill_xzzoki.svg")]
    
    
    private let searchController: UISearchController  = {
        
        let search = UISearchController(searchResultsController: DiscoversearchViewController())
        search.searchBar.placeholder = "Search By Everything"
        return search
    }()
//
//        let search = UISearchController(searchResultsController: DiscoversearchViewController())
//        search.searchBar.searchBarStyle = .prominent
//        return search
    
    
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
//        GetDoctorSpecialization.shared.getDoctorSpecialization(completion: { results in
//            switch results {
//            case .success(let categories):
//                print("Success")
//                DispatchQueue.main.async {
//                    self.specializations = categories.Specialization
//                    self.discovertable.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        })
        view.backgroundColor = .white
        title = "Discover"
        
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationItem.largeTitleDisplayMode = .never
//        navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
        
        view.addSubview(discovertable)
        discovertable.delegate = self
        discovertable.dataSource = self
        discovertable.backgroundColor = .systemBackground
        discovertable.separatorStyle = .none
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        
//      discovertable.separatorStyle = .none
        // Add the table view as a subview of the View Controller
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: self, action: #selector(presentChatViewController))
        discovertable.reloadData()
    }
    
    // MARK: - Add table view to View Controller
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discovertable.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        discovertable.reloadData()
    }
//    func updateSpecializations(_ categories: [Specialization]){
//        specializations = categories
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        print(text)
    }
	
	@objc func presentChatViewController() {
//		self.navigationController?.pushViewController(ChatiMessageViewController(), animated: true)
//			
		self.navigationController?.pushViewController(ChatViewController(), animated: true)

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
        header.backgroundColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        switch indexPath.section {
            
        case TableSectionType.upcomingSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingCollectionViewTableViewCell.identifier, for: indexPath) as? UpcomingCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            GetUpcomingAppointments.shared.getUpcomingAppointments{ results in
                switch results{
                case .success(let upcomingInfo):
//                    print(upcomingInfo.Response)
                    guard let model = upcomingInfo.Response else {return}
                    cell.configure(with: model)
                case .failure(let error):
                    print(error)
                }
            }
            cell.delegate = self
            return cell
            
        case TableSectionType.ongoingMedicationsSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCollectionViewTableViewCell.identifier, for: indexPath) as? MedicineCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            GetOngoingMedication.shared.getOngoingMedication{ results in
                switch results{
                case .success(let ongoingMedication):
                    print(ongoingMedication)
                    guard let model = ongoingMedication.Response else {return}
                    cell.configure(with: model)
                    
                case .failure(let error):
                    print(error)
                }
            }
            cell.delegate = self
            return cell
        
        case TableSectionType.categorySection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCollectionViewTableViewCell.identifier, for: indexPath) as? CategoriesCollectionViewTableViewCell else{
                return UITableViewCell()
            }
            cell.delegate = self
//            cell.configureCategory(specializations)
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

extension DiscoverViewController: DiscoverCollectionViewDelegate {
 
    func clickedOnUpcomingCell() {
//        self.navigationController?.pushViewController(UpcomingAppointmentsViewController(), animated: true)
        print("Clicked Upcoming Medications")
    }
    
    func clickedOnMedicationsCell() {
//        self.navigationController?.pushViewController(OngoingMedicationsViewController(), animated: true)
        print("Clicked Ongoing Medications")
    }
    
    func clickedOnCategoryCell(name: String) {
        
        self.navigationController?.pushViewController(ListDoctorsViewController(name: name, filter: "specialization"), animated: true)
    }
    
    func clickedOnPackagesCell() {
        self.navigationController?.pushViewController(PackagesViewController(), animated: true)
    }
}

extension DiscoverViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchVC = DiscoversearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}
