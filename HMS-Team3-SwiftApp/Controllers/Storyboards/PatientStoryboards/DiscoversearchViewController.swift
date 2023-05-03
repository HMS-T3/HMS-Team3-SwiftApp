//
//  DiscoversearchViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Devjyoti Mohanty on 03/05/23.
//

import UIKit

class DiscoversearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {

    // MARK: - Properties

    private let tableView = UITableView()
  
    private var doctors: DoctorList = DoctorList(response: [searchResponse(id: "", name: "", specialization: "", profileImg: "", gender: "")], status: false)
//    private var filteredDoctors: DoctorList = []

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    @IBAction func apiCallHandler(_ sender: Any) {
        fetchData(completion: { results in
            switch results {
            case .success(let doctorList):
                print("Search")
                DispatchQueue.main.async {
                    self.doctors = doctorList
                    print(doctorList)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    // MARK: - Private Methods

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }



    private func fetchData(completion: @escaping (Result<DoctorList, Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/search?searchString=ca&searchBy=name") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                  let data = data else {
                return
            }
                do {
                    let results = try JSONDecoder().decode(DoctorList.self, from: data)
                    print(results)
                    print("Get Successful")
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        task.resume()
//        let headers = [
//            "Content-Type": "application/json",
//            "Accept": "application/json",
//            "Authorization": "Bearer YOUR_ACCESS_TOKEN"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/search?searchString=ca&searchBy=name")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 2.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers

//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error!)
//            } else {
//                guard let data = data else { return }
//                do {
//                    let jsonData = try JSONDecoder().decode([Doctor].self, from: data)
//                    self.doctors = jsonData
//                    self.filteredDoctors = jsonData
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        })
//
//        dataTask.resume()
    }

//    private func filterContentForSearchText(_ searchText: String) {
//        filteredDoctors = doctors.filter { (doctor: Doctor) -> Bool in
//            return doctor.name.lowercased().contains(searchText.lowercased()) || doctor.specialization.lowercased().contains(searchText.lowercased())
//        }
//
//        tableView.reloadData()
//    }

    // MARK: - UITableView Delegate Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredDoctors.count
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let doctor = filteredDoctors[indexPath.row]

//        cell.textLabel?.text = "\(doctor.name) (\(doctor.specialization))"
        return cell
    }

    // MARK: - UISearchBar Delegate Methods

//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filterContentForSearchText(searchText)
//    }
}

// MARK: - Doctor Struct
