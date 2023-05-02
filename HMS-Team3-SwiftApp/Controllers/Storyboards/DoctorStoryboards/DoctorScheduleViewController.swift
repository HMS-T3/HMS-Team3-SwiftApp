//
//  DoctorScheduleViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Ujjwalsingh Rajput on 28/04/23.
//

import UIKit
import Foundation

let monthName = ["January", "February", "March", "April", "May" , "June" , "July" , "August" , "September" , "October", "November", "December"];
let monthDays = [Array(1...31), Array(1...28), Array(1...31), Array(1...30), Array(1...31), Array(1...30), Array(1...31), Array(1...31), Array(1...30), Array(1...31), Array(1...30), Array(1...31)]
var numberOfDays : Int = 0
let days = ["Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"];
struct PatientDetails{
    var name: String
    var reason: String
    var age: Int
    var gender: String
}

var patientDetailsArray: [PatientDetails] = []

class DoctorScheduleViewController: UIViewController {
    
    
    @IBOutlet weak var monthCollectionView: UICollectionView!
    @IBOutlet weak var dateTableView: UITableView!
    @IBOutlet weak var timeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTableView.dataSource = self
        dateTableView.delegate = self
        timeTableView.dataSource = self
        timeTableView.delegate = self
        monthCollectionView.dataSource = self
        monthCollectionView.delegate = self
        self.title = "Appointments"
    }
    
    var patientDetailsArray = [PatientDetails(name: "ABC", reason: "ABC", age: 10, gender: "Male"),
                               PatientDetails(name: "DEF", reason: "DEF", age: 11, gender: "Female"),
                               PatientDetails(name: "GHI", reason: "GHI", age: 12, gender: "Male"),
                               PatientDetails(name: "JKL", reason: "JKL", age: 13, gender: "Female"),
                               PatientDetails(name: "MNO", reason: "MNO", age: 14, gender: "Male"),
                               PatientDetails(name: "PQR", reason: "PQR", age: 15, gender: "Female"),
                               PatientDetails(name: "STU", reason: "STU", age: 16, gender: "Male"),
                               PatientDetails(name: "VWX", reason: "VWX", age: 17, gender: "Female"),
                               PatientDetails(name: "YZA", reason: "YZA", age: 18, gender: "Male"),
                               PatientDetails(name: "BCD", reason: "BCD", age: 19, gender: "Female")]
    
    var monthIndex : Int = 0
    func monthInit(monthIndex : Int){
        self.monthIndex = monthIndex
        print(monthIndex)
    }
    var dateIndex : Int = 0
    func dateInit(dateIndex : Int){
        self.dateIndex = dateIndex
        print(dateIndex)
    }
}




// MARK: COLLECTION VIEW
extension DoctorScheduleViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
}
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCollectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! DoctorScheduleMonthCollectionViewCell
        cell.monthOutlet.text = monthName[indexPath.section]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMonth = monthName[indexPath.section]
        print(selectedMonth)
        monthInit(monthIndex: indexPath.section)
        let cell = monthCollectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! DoctorScheduleMonthCollectionViewCell
        cell.backgroundColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
        cell.contentView.subviews.forEach { subview in
                if let label = subview as? UILabel {
                    label.textColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
                    DispatchQueue.main.async {
                        self.monthCollectionView.reloadData()
                    }
                }
            }
        monthCollectionView.reloadData()
        dateTableView.reloadData()
    }


    
}





//MARK: TableView
extension DoctorScheduleViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == dateTableView{
//            print(monthDays[monthIndex].count)
            return monthDays[monthIndex].count

        }else{
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == dateTableView{
            return 82
        }else{
            return 108
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            if tableView == dateTableView{
                return 42
            }else{
                return 16
            }
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == dateTableView{
            let cell = dateTableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DoctorScheduleDateTableViewCell
            cell.dateLabel.text = "\(monthDays[monthIndex][indexPath.section])"
            cell.dayLabel.text = days[indexPath.row]
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 0.55).cgColor
            cell.layer.cornerRadius = 5
            return cell
        }
        else{
            let cell = timeTableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! DoctorScheuleTimeTableViewCell
            cell.ageLabel.text = "\(patientDetailsArray[indexPath.section].age)" + " years"
            cell.nameLabel.text = patientDetailsArray[indexPath.section].name
            cell.reasonLabel.text = patientDetailsArray[indexPath.section].reason
            cell.genderLabel.text = patientDetailsArray[indexPath.section].gender
            cell.timeSlotLabel.text = "09:30"
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1).cgColor
            cell.layer.cornerRadius = 5
            return cell
        }

    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == dateTableView{
            let cell = dateTableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DoctorScheduleDateTableViewCell
            cell.backgroundColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
            cell.contentView.subviews.forEach { subview in
                    if let label = subview as? UILabel {
                        label.textColor = .white
                    }
                }
            let selectedDate = monthDays[monthIndex][indexPath.section]
            print(selectedDate)
            dateInit(dateIndex: indexPath.section)
//            monthCollectionView.reloadData()
//            dateTableView.reloadData()
//            timeTableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
        }
        else{
            let cell = timeTableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! DoctorScheuleTimeTableViewCell
            cell.backgroundColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
            cell.contentView.subviews.forEach { subview in
                    if let label = subview as? UILabel {
                        label.textColor = .white
                    }
                }
            let selectedPatient = patientDetailsArray[indexPath.section]
            print(selectedPatient)
            if let nextVC = storyboard?.instantiateViewController(identifier: "DoctorSchedulePatientAppointmentViewController") as? DoctorSchedulePatientAppointmentViewController{
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
//        monthCollectionView.reloadData()
//        dateTableView.reloadData()
        timeTableView.reloadData()
    }
    
    
}

extension Calendar {
    func generateDates(
        inside range: ClosedRange<Date>,
        matching components: DateComponents,
        matchingPolicy: Calendar.MatchingPolicy = .strict,
        inSameDayAs date: Date
    ) -> [Date] {
        var dates = [Date]()
        var currentDate = range.lowerBound
        while currentDate <= range.upperBound {
            if self.isDate(currentDate, inSameDayAs: date) {
                dates.append(currentDate)
            }
            currentDate = self.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }
}


