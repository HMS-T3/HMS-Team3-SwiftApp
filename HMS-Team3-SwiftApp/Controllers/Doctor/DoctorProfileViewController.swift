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
    
    @IBOutlet var submitButton: UIButton!
    
    var day: String?
    var startTime: String?
    var endTime: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the calendar style
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
//        datePicker.backgroundColor = UIColor(named: "secondary")
        datePicker?.locale = .current
//        datePicker.setValue(UIColor.white, forKey: "textColor")
//        datePicker.setValue(false, forKeyPath: "highlightsToday")
//        datePicker.setValue(0.7, forKeyPath: "alpha")
        doctorProfile.layer.cornerRadius = doctorProfile.frame.width / 2
        nameContainerView.layer.cornerRadius = 5
        ageContainerView.layer.cornerRadius = 5
        sexContainerView.layer.cornerRadius = 5
        phoneContainerView.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 4
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
