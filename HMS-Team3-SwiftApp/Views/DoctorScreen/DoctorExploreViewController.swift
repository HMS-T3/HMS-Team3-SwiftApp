//
//  DoctorExploreViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 30/04/23.
//

import UIKit

class DoctorExploreViewController: UIViewController {
    @IBOutlet var ExploreDatesCollectionView: UICollectionView!
    
    @IBOutlet var DoctorAppoinment: UICollectionView!
    
    @IBOutlet var ReportsView: UIView!
    
    @IBOutlet var PatientsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReportsView.layer.cornerRadius = 10
        PatientsView.layer.cornerRadius = 10
        registercells()
        
        ExploreDatesCollectionView.delegate = self
        ExploreDatesCollectionView.dataSource = self
        DoctorAppoinment.delegate = self
        DoctorAppoinment.dataSource = self
            
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let appointment:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        appointment.scrollDirection = .vertical
        appointment.itemSize = CGSize(width: DoctorAppoinment.bounds.width, height: 100)
        ExploreDatesCollectionView.collectionViewLayout = layout
        DoctorAppoinment.collectionViewLayout = appointment
        
//        
     
    }
    
    private func registercells(){
        ExploreDatesCollectionView.register(UINib(nibName: DoctorExploreCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorExploreCollectionViewCell.identifier)
        DoctorAppoinment.register(UINib(nibName: DoctorAppoinmentCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier)
    }
    
    
    
    


}
extension DoctorExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
   
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case ExploreDatesCollectionView:
            return CGSize(width: 70, height: 80)
        case DoctorAppoinment:
            return CGSize(width: collectionView.bounds.width, height: 100)
        default:
            return CGSize(width: 100, height: 100)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case ExploreDatesCollectionView:
            return 31
        case DoctorAppoinment:
            return 10
        default:
            return 15
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case ExploreDatesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorExploreCollectionViewCell.identifier, for: indexPath) as? DoctorExploreCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case DoctorAppoinment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier, for: indexPath) as? DoctorAppoinmentCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default: return UICollectionViewCell()
        }
    }


}

//extension DoctorExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        30
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//}

