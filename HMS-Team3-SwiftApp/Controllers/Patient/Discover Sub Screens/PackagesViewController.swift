//
//  PackagesViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import UIKit

enum PackagesSectionTypes: Int {
    case uploadPrescriptionSection = 0
    case topSellingTestsSection = 1
    case testCategoriesSection = 2
}

class PackagesViewController: UIViewController, UISearchResultsUpdating  {
    
    private let packagesSectionTitles = ["","Top Selling Tests", "Test Categories"]
    
    private let searchController: UISearchController  = {
        let search = UISearchController(searchResultsController: SearchResultsViewController())
        search.searchBar.searchBarStyle = .prominent
        return search
    }()
    
    private let packagesTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UploadPrescriptionTableViewCell.self, forCellReuseIdentifier: UploadPrescriptionTableViewCell.identifier)
        table.register(TopSellingTestsTableViewCell.self, forCellReuseIdentifier: TopSellingTestsTableViewCell.identifier)
        table.register(TestCategoriesTableViewCell.self, forCellReuseIdentifier: TestCategoriesTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Packages Screen")
        packagesTable.backgroundColor = UIColor(named: "gray.shadow")
        title = "Packages"
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        view.addSubview(packagesTable)
        packagesTable.delegate = self
        packagesTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        packagesTable.frame = view.bounds
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        //MARK: - TABLE VIEW
//
//        view.addSubview(packagesTable)
//
//        NSLayoutConstraint.activate([
//            packagesTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            packagesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            packagesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            packagesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
//
//        ])
//
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
            guard let text = searchController.searchBar.text else {return}
            print(text)
    }
    
    func openDocumentPicker() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .overFullScreen
        present(documentPicker, animated: true)
    }

}

extension PackagesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
            case PackagesSectionTypes.uploadPrescriptionSection.rawValue:
                return 120
            case PackagesSectionTypes.topSellingTestsSection.rawValue:
                return 260
            case PackagesSectionTypes.testCategoriesSection.rawValue:
                return 240
            default:
                return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case PackagesSectionTypes.uploadPrescriptionSection.rawValue:
            return packagesSectionTitles[section]
        case PackagesSectionTypes.topSellingTestsSection.rawValue:
            return packagesSectionTitles[section]
        case PackagesSectionTypes.testCategoriesSection.rawValue:
            return packagesSectionTitles[section]
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
        case PackagesSectionTypes.uploadPrescriptionSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UploadPrescriptionTableViewCell.identifier) as? UploadPrescriptionTableViewCell else { return UITableViewCell() }
            return cell
        case PackagesSectionTypes.topSellingTestsSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopSellingTestsTableViewCell.identifier) as? TopSellingTestsTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case PackagesSectionTypes.testCategoriesSection.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TestCategoriesTableViewCell.identifier) as? TestCategoriesTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case PackagesSectionTypes.uploadPrescriptionSection.rawValue:
            openDocumentPicker()
        default:
            return
        }
    }
}

extension PackagesViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        for url in urls {
            
            // Start accessing a security-scoped resource.
            guard url.startAccessingSecurityScopedResource() else {
                // Handle the failure here.
                return
            }
            
            do {
                let data = try Data.init(contentsOf: url)
                // You will have data of the selected file
                print(url)
                print(data)
                let alertController = UIAlertController(title: "Notification", message: "The PDF has been uploaded successfully.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true)
            }
            catch {
                print(error.localizedDescription)
            }
            
            // Make sure you release the security-scoped resource when you finish.
            defer { url.stopAccessingSecurityScopedResource() }
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}


extension PackagesViewController: PackagesCollectionViewDelegate{
    func clickedOnTopSellingTestsCell() {
        self.navigationController?.pushViewController(CategoriesCollectionViewController(), animated: true)
    }
    
    func clickedOnTestCategoriesCell() {
        self.navigationController?.pushViewController(CategoriesCollectionViewController(), animated: true)
    }
}
