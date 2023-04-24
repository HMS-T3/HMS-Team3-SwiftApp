//
//  RecordsTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 24/04/23.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {

    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var recordDatelLabel: UILabel!
    @IBOutlet var prescribedByLabel: UILabel!
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var recordsIcon: UIView!
    @IBOutlet var recordsView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ recordTableCell: UITableView, _ imageName : String){
        recordsView.frame.size.height = 120
        recordsView.frame.size.width = recordTableCell.bounds.width
        recordsView.backgroundColor = UIColor(named: "recordsBackground")
        recordsView.layer.cornerRadius = 8
        recordsIcon.backgroundColor = UIColor(named: "iconBackground")
        iconLabel.textColor = UIColor(named: "iconTextColor")
        recordsIcon.layer.cornerRadius = 8
        iconImage.backgroundColor = .clear
        iconImage.image = UIImage(systemName: imageName)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
