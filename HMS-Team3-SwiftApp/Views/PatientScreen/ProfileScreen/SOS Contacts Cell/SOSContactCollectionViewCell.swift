//
//  SOSContactCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 24/04/23.
//

import UIKit

class SOSContactCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var nameText: UILabel!
    @IBOutlet var relationText: UILabel!
    @IBOutlet var phoneNumberText: UILabel!
    @IBOutlet var emailText: UILabel!
    @IBOutlet var phoneNumberButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        phoneNumberButton.layer.cornerRadius = 10
        phoneNumberButton.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func phoneButton(_ sender: UIButton) {
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
    }
    
    
}
