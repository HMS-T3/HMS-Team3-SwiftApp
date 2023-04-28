//
//  ConsultViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 19/04/23.
//

import UIKit

class ConsultViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
   
    
    @IBOutlet var TopDoctorCollectionView: UICollectionView!
    @IBOutlet var CategoryCollectionView: UICollectionView!
    @IBOutlet var RecentDoctorCollectionView: UICollectionView!
    
    private let searchController: UISearchController  = {
           
            let search = UISearchController()
            search.searchBar.searchBarStyle = .prominent
            return search
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        navigationItem.searchController = searchController
                searchController.searchResultsUpdater = self
        
        //Flow for CategoryCollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (CategoryCollectionView.bounds.width - 15) / 4, height: CategoryCollectionView.bounds.height / 2)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        CategoryCollectionView.collectionViewLayout = layout
        
    
    }
    
    private func registerCells(){
        CategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        TopDoctorCollectionView.register(UINib(nibName: TopDoctorCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopDoctorCollectionViewCell.identifier)
        RecentDoctorCollectionView.register(UINib(nibName: RecentsDoctorCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecentsDoctorCollectionViewCell.identifier)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case CategoryCollectionView:
            return 8
        case TopDoctorCollectionView:
            return 4
        case RecentDoctorCollectionView:
            return 4
        default: return 8
        }}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        case CategoryCollectionView:
            if let controller = storyboard?.instantiateViewController(withIdentifier: "ListDoctorsViewController") {
                navigationController?.pushViewController(controller, animated: true)
            }
            
        case TopDoctorCollectionView:
            print("top doctor tapped")
        case RecentDoctorCollectionView:
            print("recent doctor tapped")
        default : print("Not selected")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case CategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
            
            return cell
        case TopDoctorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopDoctorCollectionViewCell.identifier, for: indexPath)as! TopDoctorCollectionViewCell
            cell.frame.size.width = 150
            cell.frame.size.height = self.TopDoctorCollectionView.frame.height
            
            return cell
        case RecentDoctorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentsDoctorCollectionViewCell.identifier, for: indexPath)as! RecentsDoctorCollectionViewCell
            return cell
            
        default: return UICollectionViewCell()
            
           
        }
        
        
        
    }
    
}
    
    
    

