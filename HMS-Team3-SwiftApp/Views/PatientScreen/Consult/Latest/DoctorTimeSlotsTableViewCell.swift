//
//  DoctorTimeSlotsTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 02/05/23.
//
import UIKit
class DoctorTimeSlotsTableViewCell: UITableViewCell {
    var lastSelected: IndexPath?
    
    static let identifier = "DoctorTimeSlotsTableViewCell"
	
	var dateFormatted: String = ""
	
	var timeSlots: DoctorAvailable = DoctorAvailable(Response: nil, Status: false)
	
	var delegate: DoctorTimeSlotsTableViewCellDelegate?
    
    private let timeSlotsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(DoctorTimeSlotsCollectionViewCell.self, forCellWithReuseIdentifier: DoctorTimeSlotsCollectionViewCell.identifier)
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(timeSlotsCollectionView)
        timeSlotsCollectionView.delegate = self
        timeSlotsCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                timeSlotsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                timeSlotsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                timeSlotsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                timeSlotsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                timeSlotsCollectionView.heightAnchor.constraint(equalToConstant: 70*5)
            ]
        )
        
        let itemWidthSize = contentView.bounds.width / 3
        let layout = timeSlotsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidthSize - 10, height: 50)
    }
    
	public func configure(dateOffset: Int, doctorID: String) {
		fetchData(offset: dateOffset, doctorID: doctorID)
        layoutSubviews()
    }
	
	func fetchData(offset: Int, doctorID: String) {
		
		let calendar = Calendar(identifier: Calendar.Identifier.indian)
		let today = Date()
		let datFormatter = DateFormatter()
		datFormatter.setLocalizedDateFormatFromTemplate("d")
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM-yyyy"
		
		let desiredDate = calendar.date(byAdding: Calendar.Component.day, value: offset - Int(datFormatter.string(from: today))!, to: today)
		let desiredDay = dateFormatter.string(from: desiredDate!)
		dateFormatted = desiredDay
//		if desiredDate! < Date() {
//			print(desiredDate)
//			return
//		}
		
		DoctorInformation.shared.isDoctorAvailable(completion: { results in
			switch results {
			case .success(let details):
				self.timeSlots = details

				DispatchQueue.main.async {
					self.timeSlotsCollectionView.reloadData()
//					if self.timeSlots.Response?.count == 0 {
//						self.delegate?.noSlots()
//					}
				}
			case .failure(let error):
				print(error)
			}
		}, doctorID: doctorID, day: desiredDay)
	}
    
}
extension DoctorTimeSlotsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return timeSlots.Response?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorTimeSlotsCollectionViewCell.identifier, for: indexPath) as? DoctorTimeSlotsCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
		cell.layer.borderColor = UIColor(named: "border")?.cgColor
		cell.backgroundColor = .clear
		cell.configure(with: timeSlots.Response?[indexPath.row] ?? ["nil"])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let lastSelected = lastSelected {
            
            let cell = collectionView.cellForItem(at: lastSelected)
            cell?.backgroundColor = .clear
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor(named: "border")?.cgColor
        }
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(named: "select")
        lastSelected = indexPath
		delegate?.clickedOnTimeCell(time: timeSlots.Response?[indexPath.row] ?? ["nil"], date: dateFormatted)
    }
	
}

extension DoctorTimeSlotsTableViewCell: UICollectionViewDelegateFlowLayout {
	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		// Return the size you want for each cell
//		return CGSize(width: 100, height: 100)
//	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		// Return the minimum interitem spacing you want
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		// Return the minimum line spacing you want
		return 10
	}

}
