//
//  DoctorProfileViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 01/05/23.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    
    @IBOutlet var doctorProfile: UIImageView!
    @IBOutlet var nameContainerView: UIView!
    @IBOutlet var ageContainerView: UIView!
    @IBOutlet var phoneContainerView: UIView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var sexContainerView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    @IBOutlet var doctorProfileHeader: UIView!
    
    @IBOutlet var submitButton: UIButton!
    
    var profileDetails: DoctorResponse = DoctorResponse(doctorInfo: DoctorInfo(specialization: "", degree: "", experience: "", description: ""), info: AdditionalInfo(profileImg: "", name: "", dateOfBirth: "", phoneNumber: "", biologicalGender: ""), _id: "", role: "", phoneNumber: "", email: "")
    var day: String?
    var startTime: String?
    var endTime: String?
    
    let doctorID = UserDefaults.standard.string(forKey: "DoctorID")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
//        fetchDoctorDetails()
        var dateComponents = DateComponents()
        dateComponents.month = 3

        if let futureDate = Calendar.current.date(byAdding: dateComponents, to: currentDate) {
            datePicker?.maximumDate = futureDate
        } else {
            print("Failed to calculate future date")
        }
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
        datePicker?.locale = .current
        datePicker?.minimumDate = currentDate
        doctorProfile.layer.cornerRadius = doctorProfile.frame.width / 2
        nameContainerView.layer.cornerRadius = 5
        ageContainerView.layer.cornerRadius = 5
        sexContainerView.layer.cornerRadius = 5
        phoneContainerView.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 4
        
        fetchDoctorDetails()
    }
    
    func fetchDoctorDetails() {
        GetUserDetails.shared.getDoctor(completion: { results in
            switch results {
            case .success(let user):
                DispatchQueue.main.async {
                    self.profileDetails = user.Response
                    self.updateProfile()
                }
            case .failure(let error):
                print(error)
            }
        }, doctorID: doctorID!)
    }
    
    func updateProfile(){
        nameLabel.text = profileDetails.info.name
        ageLabel.text = String(calculateAge(from: profileDetails.info.dateOfBirth ?? "21-10-2001") ?? 21)
        sexLabel.text = profileDetails.info.biologicalGender
        phoneLabel.text = profileDetails.phoneNumber
        doctorProfile.sd_setImage(with: URL(string: (profileDetails.info.profileImg) ))
    }
    func calculateAge(from dateOfBirth: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let calendar = Calendar.current
        let currentDate = Date()
        var ageComponents : DateComponents = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current)
        if let date = dateFormatter.date(from: dateOfBirth) {
            ageComponents = calendar.dateComponents([.year], from: date, to: currentDate)
        }
        return ageComponents.year
    }


    @IBAction func onDateChangeHandler(_ sender: UIDatePicker) {
        let selectedDate = sender.date

                // Perform actions with the selected date
            let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                let formattedDate = dateFormatter.string(from: selectedDate)
            day = formattedDate

                // Format the time
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "HH:mm"
                let formattedTime = timeFormatter.string(from: selectedDate)
        startTime = formattedTime
        
        let calendar = Calendar.current
        var endTimeCalendar = calendar.dateComponents([.hour, .minute], from: sender.date)
        endTimeCalendar.minute? += 30
        let finalTime = calendar.date(from: endTimeCalendar)
        
        endTime = timeFormatter.string(from: finalTime ?? Date())
    }
    @IBAction func onSubmitHandler(_ sender: Any) {
        if let day = day, let startTime = startTime, let endTime = endTime {
            updateAvailabilityDoctor(dayDoctor: day, startTimeDoctor: startTime, endTimeDoctor: endTime)
        } else {
            print("Kindly click on all the required fields.")
        }
    }
    
    func updateAvailabilityDoctor(dayDoctor: String, startTimeDoctor: String, endTimeDoctor: String){
        DispatchQueue.main.async {
            UpdateDoctorAvailability.shared.updateDoctorAvailability(completion: { results in
            switch results {
            case .success(let updatedAvailability):
                DispatchQueue.main.async {
                    print("Updated doctor's schedule")
                    let alert = UIAlertController(title: "Request Successful", message: updatedAvailability.response?.Message, preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    if error as! APIError == APIError.BookingAlreadyExists {
                        let alert = UIAlertController(title: "Booking slot does not exist.", message: "This slot has already been booked. Kindly book another slot.", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    }
                }
            }
        }, day: dayDoctor, startTime: startTimeDoctor, endTime: endTimeDoctor)
        }
    }
    
}
