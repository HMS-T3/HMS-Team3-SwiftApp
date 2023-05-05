//
//  DoctorAppoinmentCollectionViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 30/04/23.
//

import UIKit

class DoctorAppoinmentCollectionViewCell: UICollectionViewCell {
    static let identifier = "DoctorAppoinmentCollectionViewCell"
    @IBOutlet var TimeLable: UILabel!
    
    @IBOutlet var SymptomLable: UILabel!
    @IBOutlet var NameLable: UILabel!
    
    func configureData(_ patientDetails: UpcomingResponse){
        TimeLable.text = patientDetails.timeSlot.time.startTime
        SymptomLable.text = "Fever, coughing"
        NameLable.text = patientDetails.patient?.info.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TimeLable.font = .boldSystemFont(ofSize: 20)
        SymptomLable.font = .boldSystemFont(ofSize: 20)
        NameLable.font = .boldSystemFont(ofSize: 20)
        
//        TimeLable.text = "9.30"
//        SymptomLable.text = "fever"
//        NameLable.text = "rushil"
    }
}
