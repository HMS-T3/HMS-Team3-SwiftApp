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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addButton))
//        cellContentView.layer.cornerRadius = 10

        title = "Medical History"
		view.backgroundColor = .systemBackground
        MedicalHIstoryCollectionView.delegate = self
        MedicalHIstoryCollectionView.dataSource = self
    }
    
    @objc func addButton() {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "addHistory") {
            self.present(controller, animated: true)
        }
        
    }
    

}

extension MedicalHistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historycell", for: indexPath)
        cell.layer.cornerRadius = 10
        return cell
        
    }
    
    
    
    
}
