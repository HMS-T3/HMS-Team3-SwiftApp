//
//  DoctorExploreViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Akshat Naruka on 30/04/23.
//

import UIKit

struct Doctor7days{
    let date:String
    let day:String
}

class DoctorExploreViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet var ExploreDatesCollectionView: UICollectionView!
    
    @IBOutlet var DoctorAppoinment: UICollectionView!
    
    @IBOutlet var ReportsView: UIView!
    
    @IBOutlet var PatientsView: UIView!
    
    @IBOutlet var noOfAppointmentsLabel: UILabel!
    
    @IBOutlet var noOfAppointmentsVIew: UIView!
    var lastSelected: IndexPath?
    
    var DoctorworkingDays: [Doctor7days] = []
    var initialResponse: UpcomingDetails = UpcomingDetails(Response: [], Status: true)
    var patientDetailsResponse: [UpcomingResponse] = []
    var delegate: DoctorExploreViewControllerDelegate?
    let doctorId = UserDefaults.standard.string(forKey: "DoctorID")
    var noOfAppointments:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReportsView.layer.cornerRadius = 10
        PatientsView.layer.cornerRadius = 10
        registercells()
        
        ExploreDatesCollectionView.delegate = self
        ExploreDatesCollectionView.dataSource = self
        DoctorAppoinment.delegate = self
        DoctorAppoinment.dataSource = self
            
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let appointment:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        appointment.scrollDirection = .vertical
        appointment.itemSize = CGSize(width: DoctorAppoinment.bounds.width, height: 100)
        ExploreDatesCollectionView.collectionViewLayout = layout
        DoctorAppoinment.collectionViewLayout = appointment
        
        DispatchQueue.main.async { [self] in
            getNext7WorkingDays()
        }
        fetchDoctorSchedule(Date())
    }
    
    private func registercells(){
        ExploreDatesCollectionView.register(UINib(nibName: DoctorExploreCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorExploreCollectionViewCell.identifier)
        DoctorAppoinment.register(UINib(nibName: DoctorAppoinmentCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier)
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
                        self.noOfAppointments = self.patientDetailsResponse.count
                        self.noOfAppointmentsLabel.text = "You have \(self.noOfAppointments) \(self.noOfAppointments == 1 ? "Appointment" :"Appointments") today!"
                        self.ExploreDatesCollectionView.reloadData()
                        self.DoctorAppoinment.reloadData()
                        self.noOfAppointmentsVIew.reloadInputViews()
                    }
                    self.ExploreDatesCollectionView.reloadData()
                }
                case .failure(let error):
                print(error)
            }
        }, doctorID: doctorId!, day: dateString)
    }
    


}
extension DoctorExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
   
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case ExploreDatesCollectionView:
            return CGSize(width: 70, height: 80)
        case DoctorAppoinment:
            return CGSize(width: collectionView.bounds.width, height: 100)
        default:
            return CGSize(width: 100, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        case ExploreDatesCollectionView:
            if let lastSelected = lastSelected {
                let cell = collectionView.cellForItem(at: lastSelected)
                cell?.backgroundColor = .clear
                cell?.layer.borderColor = UIColor(named: "border")?.cgColor
                cell?.layer.borderWidth = 1
            }
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor(named: "select")
            lastSelected = indexPath
            delegate?.clickedOnDateButton(dateOffset: (Int(DoctorworkingDays[indexPath.row].date) ?? 0))
        default:
            lastSelected = indexPath
            let cell = collectionView.cellForItem(at: lastSelected!)
            cell?.backgroundColor = .clear
            cell?.layer.borderColor =  UIColor(named: "border")?.cgColor
            cell?.layer.borderWidth = 0.5
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case ExploreDatesCollectionView:
            //return days in a week
            return 7
        case DoctorAppoinment:
            //return number of appointments 
            return self.noOfAppointments
        default:
            return 15
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case ExploreDatesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorExploreCollectionViewCell.identifier, for: indexPath) as? DoctorExploreCollectionViewCell else { return UICollectionViewCell() }
            print(patientDetailsResponse)
//            cell.configureData(patientDetailsResponse[0])
            cell.layer.borderColor = UIColor(named: "border")?.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
//            cell.DateLabel.text = Date().string(format: "d")
//            cell.DayLabel.text = Date().string(format: "E")
            if DoctorworkingDays.count == 7 {
//                cell.DoctorConfigure(date: DoctorworkingDays[indexPath.row].date, day: DoctorworkingDays[indexPath.row].day)
                cell.DateLabel.text = DoctorworkingDays[indexPath.row].date
                cell.DayLabel.text = DoctorworkingDays[indexPath.row].day
            }
            return cell
        case DoctorAppoinment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorAppoinmentCollectionViewCell.identifier, for: indexPath) as? DoctorAppoinmentCollectionViewCell else { return UICollectionViewCell() }
            cell.configureData(patientDetailsResponse[indexPath.section])
            cell.layer.borderColor = UIColor(named: "border")?.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    
    func getNext7WorkingDays() {
        let calendar = Calendar(identifier: Calendar.Identifier.indian)
        var todayDate = Date()
        let dateFromatterDate = DateFormatter()
        dateFromatterDate.setLocalizedDateFormatFromTemplate("d")
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.setLocalizedDateFormatFromTemplate("E")
        if !calendar.isDateInWeekend(todayDate) {
            DoctorworkingDays.append(Doctor7days(date: dateFromatterDate.string(from: todayDate), day: dateFormatterDay.string(from: todayDate)))
        }
        while DoctorworkingDays.count < 7 {
            todayDate = calendar.date(byAdding: Calendar.Component.day, value: 1, to: todayDate)!
            DoctorworkingDays.append(Doctor7days(date: dateFromatterDate.string(from: todayDate), day: dateFormatterDay.string(from: todayDate)))
        }
        DispatchQueue.main.async {
            self.ExploreDatesCollectionView.reloadData()
        }
    }

}




