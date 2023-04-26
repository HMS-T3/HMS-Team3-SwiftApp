//
//  SOSContactsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit

class SOSContactsViewController: UIViewController {
    
    
    @IBOutlet var contactsCardCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SOS Contacts"
		view.backgroundColor = .systemBackground
    }

}

extension SOSContactsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        

        cell.layer.borderWidth = 2
//        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 18
//        cell.backgroundColor = UIColor."#199A8E"
    
        return cell
    }
    
    
}
