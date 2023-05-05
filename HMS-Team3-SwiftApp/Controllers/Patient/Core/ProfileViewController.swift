//
//  ProfileViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 19/04/23.
//

import UIKit

struct ProfileStaticInfo {
	
	let imageSystemName: String
	let mainLabelText: String
	let subLabelText: String
	
	static let staticData: [ProfileStaticInfo] = [
		ProfileStaticInfo(imageSystemName: "cross.case.fill",
				   mainLabelText: "Medical History",
				   subLabelText: "Check all your medical History"),
		
		ProfileStaticInfo(imageSystemName: "doc.on.doc.fill",
				   mainLabelText: "Vitals",
				   subLabelText: "Check all your Invoice History"),
		
		ProfileStaticInfo(imageSystemName: "person.2.fill",
				   mainLabelText: "SOS Contacts",
				   subLabelText: "Check all close contacts list"),
		
		ProfileStaticInfo(imageSystemName: "heart.fill",
				   mainLabelText: "Apple health",
				   subLabelText: "Check your vitals from Apple Health"),
		
		ProfileStaticInfo(imageSystemName: "person.2.fill",
				   mainLabelText: "To Be Changed",
				   subLabelText: "To Collection View")
	]
}

enum TableSections: Int {
	
	case MedicalHistory = 0
	case Invoice = 1
	case SOS = 2
	case AppleHealth = 3
	case Stats = 4
}

class ProfileViewController: UIViewController {
	
	private let tableSectionsTitles: [String] = ["Medical History", "Invoice", "SOS Contacts", "Apple Health", "Quick Stats"]
	
    var personalInfo: UserResponse = UserResponse(id: "12345", info: PersonalInfo(profileImg: "https://ymw.edu.in/wp-content/uploads/2022/02/dummy-profile-01.png", name: "John Doe", dateOfbirth: Date(), phoneNumber: "9910740324", biologicalGender: "Female"), role: "patient", phoneNumber: "38493124798", email: "", password: "wfgrdw" ,appointments: [], schedule: [], emergencyContacts: [])
	
	private let profileTableView: UITableView = {
		
		let table = UITableView(frame: .zero, style: .grouped)
		table.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
		table.register(QuickStatsTableViewCell.self, forCellReuseIdentifier: QuickStatsTableViewCell.identifier)
		table.translatesAutoresizingMaskIntoConstraints = false
		table.showsVerticalScrollIndicator = false
		return table
	}()
	
	init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, patientInfo: UserResponse) {
		self.personalInfo = patientInfo
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor(named: "ProfileBackground")
        
        fetchPatientDetails() //function to get patient details from the api
		title = "Profile"
		self.navigationController?.navigationBar.prefersLargeTitles = false
		self.navigationItem.largeTitleDisplayMode = .never

		view.addSubview(profileTableView)
		profileTableView.delegate = self
		profileTableView.dataSource = self
		profileTableView.tableHeaderView = ProfileHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 180), delegate: self, profileDetails: personalInfo)
		profileTableView.backgroundColor = UIColor(named: "ProfileBackground")
		profileTableView.separatorStyle = .none
		
		AppleHealthFunctions.shared.askForHealthKitPermission()
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		NSLayoutConstraint.activate(
			[
				profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
				profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
				profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			]
		)
	}
    func fetchPatientDetails() {
        GetUserDetails.shared.getPatient(completion: { results in
            switch results {
            case .success(let user):
                print("Get Patient")
                DispatchQueue.main.async {
                    self.personalInfo = user.userResponse
                    self.updateProfile()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    func updateProfile() {
        profileTableView.tableHeaderView = ProfileHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 180), delegate: self, profileDetails: personalInfo)
        
    }
       
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return tableSectionsTitles.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == TableSections.Stats.rawValue {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: QuickStatsTableViewCell.identifier, for: indexPath) as? QuickStatsTableViewCell else { return UITableViewCell() }
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
			
			switch indexPath.section {
			case TableSections.AppleHealth.rawValue:
				cell.backgroundColor = UIColor(named: "ProfileAppleHealth")
			default:
				cell.backgroundColor = UIColor(named: "ProfileTableCells")
			}
			cell.layer.cornerRadius = 10
			cell.configure(with: ProfileStaticInfo.staticData[indexPath.section])
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 0
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "This will never be displayed" // Only for heightForHeaderInSection to work properly. DO NOT REMOVE.
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case TableSections.Stats.rawValue:
			return 150
		default:
			return 100
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		switch indexPath.section {
		case TableSections.MedicalHistory.rawValue:
            let controller = storyboard?.instantiateViewController(withIdentifier: "MedicalHistoryViewController")
			self.navigationController?.pushViewController(controller!, animated: true)
		case TableSections.Invoice.rawValue:
            let invoiceStoryboard = UIStoryboard(name: "Invoice", bundle: nil)
            let controller = invoiceStoryboard.instantiateViewController(withIdentifier: "InvoiceViewController") 
                self.navigationController?.pushViewController(controller, animated: true)
		case TableSections.SOS.rawValue:
            let sosStoryBoard = UIStoryboard(name: "SOS Contacts", bundle: nil)
            let controller = sosStoryBoard.instantiateViewController(withIdentifier: "SOSContacts")
                self.navigationController?.pushViewController(controller, animated: true)
        case TableSections.AppleHealth.rawValue:
            self.navigationController?.pushViewController(AppleHealthViewController(), animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension ProfileViewController: ProfileHeaderUIViewDelegate {
	
	func clickedOnEditButton() {
        let editStoryboard = UIStoryboard(name: "EditProfileStoryboard", bundle: nil)
        let controller = editStoryboard.instantiateViewController(withIdentifier: "EditProfileViewController")
            self.navigationController?.pushViewController(controller, animated: true)
	}
}
