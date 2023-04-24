//
//  RecordViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 24/04/23.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet var recordsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordsTableView.delegate = self
        recordsTableView.dataSource = self
        recordsTableView.separatorStyle = .none
        
    }
}
extension RecordViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordsTableCell", for: indexPath) as! RecordsTableViewCell
        cell.backgroundColor = .clear
        cell.configureCell(recordsTableView)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Last week"
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.frame.size.width = tableView.bounds.width
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
        header.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        header.textLabel?.leadingAnchor.constraint(equalTo: tableView.leadingAnchor)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
}

