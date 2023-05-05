//
//  DoctorScheduledAppointmentsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Niya Shameer on 04/05/23.
//

import UIKit

class DoctorScheduledAppointmentsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var selectedDate = Date()
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var timeTableView: UITableView!
    
    var initialResponse: UpcomingDetails = UpcomingDetails(Response: [], Status: true)
                               
    var patientDetailsResponse: [UpcomingResponse] = []

        var totalSquares = [Date]()
        let doctorId = UserDefaults.standard.string(forKey: "DoctorID")
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            timeTableView.dataSource = self
            timeTableView.delegate = self
            self.title = "Appointments"
            setCellsView()
            setWeekView()
            fetchDoctorSchedule(selectedDate)
        }
    
    func fetchDoctorSchedule(_ currentDate: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        DoctorInformation.shared.getDoctorSchedule(completion: { results in
            switch results {
            case .success(let doctorSchedule):
                DispatchQueue.main.async {
                    self.initialResponse = doctorSchedule
                    if let response = self.initialResponse.Response {
                        self.patientDetailsResponse = response
                    }
                    self.timeTableView.reloadData()
                }
                case .failure(let error):
                print(self.selectedDate)
                print(error)
            }
        }, doctorID: doctorId!, day: dateString)
    }
        func setCellsView()
        {
            let width = (cellCollectionView.frame.size.width - 2) / 8
            let height = (cellCollectionView.frame.size.height - 2)
            
            let flowLayout = cellCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: width, height: height)
        }
        
        func setWeekView()
        {
            totalSquares.removeAll()
            
            var current = CalendarHelper().sundayForDate(date: self.selectedDate)
            let nextSunday = CalendarHelper().addDays(date: current, days: 7)
            
            while (current < nextSunday)
            {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current, days: 1)
            }
            
            monthLabel.text = CalendarHelper().monthString(date: self.selectedDate)
            + " " + CalendarHelper().yearString(date: self.selectedDate)
            cellCollectionView.reloadData()
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            totalSquares.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
            
            let date = totalSquares[indexPath.item]
            cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
            
            if(date == selectedDate)
            {
                cell.backgroundColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
            }
            else
            {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            selectedDate = totalSquares[indexPath.item]
            fetchDoctorSchedule(selectedDate)
            collectionView.reloadData()
        }
        
        @IBAction func previousWeek(_ sender: Any)
        {
            self.selectedDate = CalendarHelper().addDays(date: self.selectedDate, days: -7)
            setWeekView()
        }
        
        @IBAction func nextWeek(_ sender: Any)
        {
            self.selectedDate = CalendarHelper().addDays(date: self.selectedDate, days: 7)
            setWeekView()
        }
        
        override open var shouldAutorotate: Bool
        {
            return false
        }
        
        override func viewDidAppear(_ animated: Bool)
        {
            super.viewDidAppear(animated)
        }
        
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


    extension DoctorScheduledAppointmentsViewController: UITableViewDataSource, UITableViewDelegate {
            
        func numberOfSections(in tableView: UITableView) -> Int {
            return patientDetailsResponse.count
            }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 108
            }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0{
                return 0
            }
            else{
                return 16
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
            let cell = timeTableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! DoctorScheduleTimeTableViewCell
                  let patientDetails = patientDetailsResponse[indexPath.section]

            cell.configureValues(patientDetails: patientDetails)

//                let cell = timeTableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! DoctorScheduleTimeTableViewCell
//            cell.configureValues(patientDetails: patientDetailsResponse[indexPath.section])
                cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1).cgColor
                cell.layer.cornerRadius = 5
                return cell
            }

        
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let cell = timeTableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! DoctorScheduleTimeTableViewCell
                cell.backgroundColor = UIColor(red: 25/255.0, green: 154/255.0, blue: 142/255.0, alpha: 1)
            cell.contentView.subviews.forEach { subview in
                if let label = subview as? UILabel {
                    label.textColor = .white
                }
            }
                let selectedPatient = patientDetailsResponse[indexPath.section]
    //            if let nextVC = storyboard?.instantiateViewController(identifier: "DoctorSchedulePatientAppointmentViewController") as? DoctorSchedulePatientAppointmentViewController{
    //                self.navigationController?.pushViewController(nextVC, animated: true)
    //            }
                
                tableView.deselectRow(at: indexPath, animated: true)
    //        monthCollectionView.reloadData()
    //        dateTableView.reloadData()
            timeTableView.reloadData()
        }
        
        
    }

