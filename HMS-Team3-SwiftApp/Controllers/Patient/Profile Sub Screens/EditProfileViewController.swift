//
//  ViewController.swift
//  Edit Profile
//
//  Created by Kushagra Verma on 04/05/23.
//

import UIKit

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var dpImage : UIImage!
    var dpchanged : Bool = false
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var dateTF: UITextField!
   // let image = UIImage(named: "profilePhoto")
    override func viewDidLoad() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange (datePicker:)), for:
        UIControl.Event.valueChanged)
        datePicker.maximumDate = Date()
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateTF?.inputView = datePicker
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width/2
        profilePhoto?.clipsToBounds = true
        profilePhoto?.layer.borderWidth = 3.0
        profilePhoto?.layer.borderColor = UIColor.gray.cgColor
        
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeProfilePictureButtonTapped(_ sender: UIButton) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage{
            dpImage = image
            profilePhoto.image = dpImage
//            profilePhoto.image = image
            dpchanged = true
//            dpImage = image
        }
        picker.dismiss(animated: true,completion: nil)
    }
    
    @objc func dateChange (datePicker: UIDatePicker)
    {  dateTF.text = formatDate (date: datePicker.date)
    }
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
}

