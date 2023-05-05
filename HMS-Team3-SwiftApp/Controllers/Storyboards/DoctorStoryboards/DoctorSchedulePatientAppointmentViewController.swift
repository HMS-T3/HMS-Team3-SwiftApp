//
//  ViewController.swift
//  Appointment screen
//
//  Created by Kushagra Verma on 28/04/23.
//

import UIKit



class DoctorSchedulePatientAppointmentViewController: UIViewController {
    @IBOutlet weak var locationView : UIView!
    @IBOutlet weak var nationalityView: UIView!
    @IBOutlet weak var bloodView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var bpmView: UIView!
    @IBOutlet weak var sleepView: UIView!
    @IBOutlet weak var visitedButton: UIButton!
    @IBOutlet weak var reschduleButton: UIButton!
    @IBOutlet weak var calenderImage: UIImageView!
    @IBOutlet weak var clockImage: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientInformationView: UIView!
    @IBOutlet weak var patientAgeView: UILabel!
    @IBOutlet weak var patientSexLabel: UILabel!

    @IBAction func buttonClicked(_ sender: Any) {
        visitedButton.layer.backgroundColor = UIColor(named : "secondary")?.cgColor
        
    }
    
    var patientDetails : UpcomingResponse = UpcomingResponse(timeSlot: TimeSlot(time: Time(startTime: "", endTime: ""), user: "", booked: false, day: "", created: ""), completed: false, chat: false, doctor: UpcomingDoctorResponse(doctorInfo: DoctorInfo(specialization: "", degree: "", experience: "", description: ""), info: AdditionalInfo(profileImg: "", name: "", dateOfBirth: "", biologicalGender: ""), _id: "", email: "", phoneNumber: ""), patient: UpcomingPatientResponse(info: AdditionalInfo(profileImg: "", name: "", dateOfBirth: "", biologicalGender: ""), _id: "", email: ""), created: "")
    
    @IBAction func permissionForChat(_ sender: UISwitch) {
        if(sender.isOn == true){
            postDoctorPermissions()
        }
    }
    
            func postDoctorPermissions() {
                UpdateChatPermission.shared.updateChatPermission(completion: { results in
                    switch results {
                    case .success(let permissionResponse):
                        DispatchQueue.main.async {
                            print("Updated user permission")
                            let alert = UIAlertController(title: "Request Successful", message: permissionResponse.response.message, preferredStyle: .actionSheet)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(alert, animated: true)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
        //                        let alert = UIAlertController(title: "Request Unsuccesful", message: error, preferredStyle: .actionSheet)
        //                        alert.addAction(UIAlertAction(title: "OK", style: .default))
        //                        self.present(alert, animated: true)
                            print("error")
                        }
                    }
                }, day: patientDetails.timeSlot.day, startTime: patientDetails.timeSlot.time.startTime, endTime: patientDetails.timeSlot.time.endTime)
            }
            
    @IBAction func setStatus(_ sender: UIButton!) {
//        visitedButton.setImage(UIImage(systemName: "checkmark"), for: .selected)
        sender.backgroundColor = .black
    }
    
    func configureData(_ data: UpcomingResponse){
        self.patientNameLabel.text = data.patient?.info.name
        self.patientSexLabel.text = data.patient?.info.biologicalGender
        self.patientAgeView.text = data.patient?.info.dateOfBirth
        self.patientDetails = data
    }
    
    override func viewDidLoad() {
        reschduleButton.backgroundColor = .gray
        visitedButton.layer.borderWidth = 1
        visitedButton.layer.borderColor = UIColor.black.cgColor
        visitedButton.layer.cornerRadius = 5
        statsView.layer.cornerRadius = 13
        bpmView.layer.cornerRadius = 13
        sleepView.layer.cornerRadius = 13
        patientInformationView.layer.cornerRadius = 13
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        userImageView.clipsToBounds = true
        patientAgeView.layer.cornerRadius = 4
        patientAgeView.layer.masksToBounds = true
        patientSexLabel.layer.masksToBounds = true
        patientSexLabel.layer.cornerRadius = 4
        calenderImage.layer.cornerRadius = 8
        clockImage.layer.cornerRadius = 8
        locationView.layer.cornerRadius = 5
        locationView.clipsToBounds = true
        bloodView.layer.cornerRadius = 5
        bloodView.clipsToBounds = true
        nationalityView.layer.cornerRadius = 5
        nationalityView.clipsToBounds = true
        patientNameLabel.textAlignment = .center
        patientSexLabel.textAlignment = .center
        patientAgeView.textAlignment = .center
        super.viewDidLoad()
       // visitedButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }



    
}
