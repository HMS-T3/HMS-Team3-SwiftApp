//
//  DoctorDetailsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 05/02/1945 Saka.
//
import UIKit
enum DocotorAppointmentFeedSections: Int {
    case AboutDoctor = 0
    case dateOfDoctor = 1
    case timeSlotsOfDate = 2
}
import UIKit
class DoctorDetailsViewController: UIViewController {
    
    let doctorID: String
    
    var doctorInfo: DoctorDetails = DoctorDetails(Response: DoctorResponse(doctorInfo: DoctorInfo(specialization: "nil", degree: "nil", experience: "nil", description: "nil"), info: AdditionalInfo(profileImg: "nil", name: "nil", dateOfBirth: "nil", phoneNumber: "nil", biologicalGender: "nil"), _id: "nil", role: "nil", phoneNumber: "nil", email: "nil"))
    
    private let docotorAppointmentFeed: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(AboutDoctorTableViewCell.self, forCellReuseIdentifier: AboutDoctorTableViewCell.identifier)
        table.register(DoctorDatesTableViewCell.self, forCellReuseIdentifier: DoctorDatesTableViewCell.identifier)
        table.register(DoctorTimeSlotsTableViewCell.self, forCellReuseIdentifier: DoctorTimeSlotsTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 500
        return table
    }()
	
	var dateOffset = 0
    
    private let bookAppointmentButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Book Appointment", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(doctorID: String) {
        self.doctorID = doctorID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Doctor Details"
        view.backgroundColor = .systemBackground
        
        view.addSubview(docotorAppointmentFeed)
        docotorAppointmentFeed.delegate = self
        docotorAppointmentFeed.dataSource = self
        docotorAppointmentFeed.tableHeaderView = DoctorInfoUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200), info: doctorInfo)
        docotorAppointmentFeed.separatorStyle = .none
        docotorAppointmentFeed.backgroundColor = .systemBackground
        
        view.addSubview(bookAppointmentButton)
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        docotorAppointmentFeed.frame = view.bounds
        
        bookAppointmentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        bookAppointmentButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2 + 10).isActive = true
        bookAppointmentButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        bookAppointmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func fetchData() {
		GetUserDetails.shared.getDoctor(completion: { resulst in
			switch resulst {
			case .success(let details):
				DispatchQueue.main.async {
					self.doctorInfo = details
					self.docotorAppointmentFeed.tableHeaderView = DoctorInfoUIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200), info: details)
					self.docotorAppointmentFeed.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		},doctorID: doctorID)
	}
}
extension DoctorDetailsViewController: UITableViewDelegate, UITableViewDataSource {
	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case DocotorAppointmentFeedSections.AboutDoctor.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutDoctorTableViewCell.identifier, for: indexPath) as? AboutDoctorTableViewCell else { return UITableViewCell() }
			cell.configure(text: doctorInfo.Response.doctorInfo.description)
            return cell
        case DocotorAppointmentFeedSections.dateOfDoctor.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DoctorDatesTableViewCell.identifier, for: indexPath) as? DoctorDatesTableViewCell else { return UITableViewCell() }
			cell.delegate = self
            cell.configure()
            return cell
        case DocotorAppointmentFeedSections.timeSlotsOfDate.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DoctorTimeSlotsTableViewCell.identifier, for: indexPath) as? DoctorTimeSlotsTableViewCell else { return UITableViewCell() }
			cell.delegate = self
            cell.configure(dateOffset: dateOffset, doctorID: doctorID)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case DocotorAppointmentFeedSections.AboutDoctor.rawValue:
            tableView.deselectRow(at: indexPath, animated: true)
            let cell = tableView.cellForRow(at: indexPath) as! AboutDoctorTableViewCell
            cell.fullTextView()
            DispatchQueue.main.async {
                self.docotorAppointmentFeed.reloadData()
            }
            
        default:
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension DoctorDetailsViewController: DoctorDatesTableViewCellDelegate {
	
	func clickedOnDateButton(dateOffset: Int) {
		self.dateOffset = dateOffset
		
		docotorAppointmentFeed.reloadData()
	}
}

extension DoctorDetailsViewController: DoctorTimeSlotsTableViewCellDelegate {
	
	func clickedOnTimeCell(time: [String], date: String) {
		print("Time: \(time), date: \(date)")
	}
}








