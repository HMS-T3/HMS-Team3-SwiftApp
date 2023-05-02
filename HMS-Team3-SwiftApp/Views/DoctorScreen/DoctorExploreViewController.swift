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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registercells()
        
        ExploreDatesCollectionView.delegate = self
        ExploreDatesCollectionView.dataSource = self
        DoctorAppoinment.delegate = self
        DoctorAppoinment.dataSource = self
            
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        ExploreDatesCollectionView.collectionViewLayout = layout
        DoctorAppoinment.collectionViewLayout = layout
//        
     
    }
    
    private func registercells(){
        ExploreDatesCollectionView.register(UINib(nibName: DoctorExploreCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorExploreCollectionViewCell.identifier)
        DoctorAppoinment.register(UINib(nibName: DoctorAppoinmentCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier)
    }
    
    
    
    


}
extension DoctorExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case ExploreDatesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorExploreCollectionViewCell.identifier, for: indexPath) as? DoctorExploreCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        case DoctorAppoinment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier, for: indexPath) as? DoctorAppoinmentCollectionViewCell else { return UICollectionViewCell() }
            cell.NameLable.text = "hms3"
            cell.TimeLable.text = "khg"
            cell.SymptomLable.text = "kugiuy"
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    
}
