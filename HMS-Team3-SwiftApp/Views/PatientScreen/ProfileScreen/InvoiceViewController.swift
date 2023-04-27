//
//  InvoiceViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Devjyoti Mohanty on 27/04/23.
//

import UIKit


class InvoiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none

        title = "Vitals"
        view.backgroundColor = .systemBackground
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceTableCell", for: indexPath )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
