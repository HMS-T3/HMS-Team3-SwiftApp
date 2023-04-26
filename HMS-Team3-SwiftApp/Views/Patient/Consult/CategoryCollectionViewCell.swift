//
//  CategoryCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 19/04/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet var CatagoryView: UIView!
    @IBOutlet var CategoryImageLabel: UIImageView!
    
    @IBOutlet var CategoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
      
       // let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        CategoryImageLabel.clipsToBounds = false
        CategoryImageLabel.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        CategoryImageLabel.layer.borderWidth = 1
        CategoryImageLabel.layer.cornerRadius = 20
       // CatagoryView.addSubview(CategoryImageLabel)
        
       
        CategoryImageLabel.clipsToBounds = true
        CategoryImageLabel.layer.cornerRadius = 10
        
        
        CategoryImageLabel.image = #imageLiteral(resourceName: "Doctor")
        CategoryNameLabel.text = "HMS3"
        // Initialization code
        
    }
   
    
  

}
