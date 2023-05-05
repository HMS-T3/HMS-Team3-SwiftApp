//
//  SOSContactsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit
import Contacts
import ContactsUI


struct Contacts{
    var sosContact:CNPhoneNumber?
    var name:String?
}

var contactsArray = [Contacts]()



class SOSContactsViewController: UIViewController, CNContactPickerDelegate{
    
    
    @IBOutlet var contactsCardCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SOS Contacts"
		view.backgroundColor = .systemBackground
    }

    @IBAction func AddContacts(_ sender: Any) {
        let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
    }
    
    @IBAction func callCell(_ sender: Any) {
        if let url1 = URL(string: "tel://\(9752070321)"),
           UIApplication.shared.canOpenURL(url1) {
            UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        }
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        for contact in contacts {
            var name = contact.givenName
            for number in contact.phoneNumbers{
                var phoneNumber = number.value
                contactsArray.append(Contacts(sosContact: phoneNumber,name: name))
                print(contactsArray[0])
            }
        }
    }
    
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
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
