//
//  ListDoctorsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 24/04/23.
//

import UIKit

class ListDoctorsViewController: UIViewController, UISearchResultsUpdating {
    
    @objc(updateSearchResultsForSearchController:) func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
    
    private let searchController: UISearchController  = {
           
            let search = UISearchController()
            search.searchBar.searchBarStyle = .prominent
            return search
        }()
    
    
    @IBOutlet var ListDoctorCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        navigationItem.searchController = searchController
                searchController.searchResultsUpdater = self

       
    }
    
    
    //TODO: Filter doctors
    
    
    private func registerCells(){
        ListDoctorCollectionView.register(UINib(nibName: DoctorCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DoctorCollectionViewCell.identifier)
        
    }
    
}

extension ListDoctorsViewController:  UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCollectionViewCell.identifier, for: indexPath)as! DoctorCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DoctorDetailsViewController(doctorID: "64514f5879c1cbdc78f81f78"), animated: true)
    }
    
    
    
}

