//
//  sosContactsCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 04/05/23.
//

//import UIKit
//import Contacts
//import ContactsUI
//
//class sosContactsCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier = "cell"
//    
//    @IBOutlet var sosView: UIView!
//    
//    @IBOutlet var sosName: UILabel!
//    
//    @IBOutlet var sosRelation: UILabel!
//    
//    @IBOutlet var sosContactNumber: UILabel!
//    
//    @IBOutlet var sosContactEmail: UILabel!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        sosView.layer.cornerRadius = 5
//        sosView.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
//    }
//    
//    @IBAction func CallsosContact(_ sender: Any) {
//        if let url1 = URL(string: "tel://\(9752070321)"),
//           UIApplication.shared.canOpenURL(url1) {
//            UIApplication.shared.open(url1, options: [:], completionHandler: nil)
//        }
//
//    }
//    
//    @IBAction func EmailsosContact(_ sender: Any) {
//        UIApplication.shared.open(URL(string: "mailto:test@gmail.com")! as URL,
//                options: [:], completionHandler: nil)
//    }
//    
//    
//}
