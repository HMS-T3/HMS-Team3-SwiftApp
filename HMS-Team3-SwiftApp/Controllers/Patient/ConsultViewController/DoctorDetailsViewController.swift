//
//  DoctorDetailsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 05/02/1945 Saka.
//

import UIKit

//class DoctorDetailsViewController: UIViewController {
//
//
//    @IBOutlet weak var datesCollectionView: UICollectionView!
//        @IBOutlet weak var slotsCollectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//
//
//}


import UIKit

class DoctorDetailsViewController: UIViewController {
    
    @IBOutlet weak var datesCollectionView: UICollectionView!
    @IBOutlet weak var slotsCollectionView: UICollectionView!
    
    let dates = ["Apr 1", "Apr 2", "Apr 3", "Apr 4", "Apr 5", "Apr 6", "Apr 7", "Apr 8", "Apr 9", "Apr 10", "Apr 11", "Apr 12", "Apr 13", "Apr 14", "Apr 15", "Apr 16", "Apr 17", "Apr 18", "Apr 19", "Apr 20", "Apr 21", "Apr 22", "Apr 23", "Apr 24", "Apr 25", "Apr 26", "Apr 27", "Apr 28", "Apr 29", "Apr 30"]
    
    let slots = ["9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register custom cells
        let dateCellNib = UINib(nibName: "DateCollectionViewCell", bundle: nil)
        datesCollectionView.register(dateCellNib, forCellWithReuseIdentifier: "DateCell")
        
        let slotCellNib = UINib(nibName: "SlotCollectionViewCell", bundle: nil)
        slotsCollectionView.register(slotCellNib, forCellWithReuseIdentifier: "SlotCell")
        
        // Set data source and delegate
        datesCollectionView.dataSource = self
        datesCollectionView.delegate = self
        
        
        slotsCollectionView.dataSource = self
        slotsCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension DoctorDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == datesCollectionView {
            return dates.count
        } else {
            return slots.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == datesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as! DateCollectionViewCell
            
            cell.DateLabel.text = dates[indexPath.item]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlotCell", for: indexPath) as! SlotCollectionViewCell
            
            cell.SlotLabel.text = slots[indexPath.item]
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DoctorDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 3
        let cellHeight: CGFloat = 50
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UICollectionViewDelegate
extension DoctorDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if collectionView == datesCollectionView {
               // Handle selection of a date
               collectionView.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
               print("Selected date: \(dates[indexPath.item])")
           } else {
               // Handle selection of a time slot
               print("Selected time slot: \(slots[indexPath.item])")
           }
       }
}

