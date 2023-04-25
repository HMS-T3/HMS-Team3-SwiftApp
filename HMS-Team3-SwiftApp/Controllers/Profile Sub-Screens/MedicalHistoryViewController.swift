//
//  MedicalHistoryViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit

class MedicalHistoryViewController: UIViewController {
    
    var disease : [String] = ["Cancer", "Migraine","Fever"]
    var cData:[Cancer] = []
    var mData:[Migraine] = []

    @IBOutlet var MedicalHIstoryCollectionView: UICollectionView!
    
    
    
    //    cData = [
//        Cancer(name: "Cancer", img: UIImage?, title: "Bindra")]
//
//    mData = [
//        Migraine(name: "Migraine", img: UIImage?, title: "Bindra")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        title = "Medical History"
		view.backgroundColor = .systemBackground
    }
    
    

}

extension MedicalHistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historycell", for: indexPath)
        return cell
    }
    
    
}
