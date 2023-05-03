//
//  DoctorDatesTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 01/05/23.
//
import UIKit
struct Next7Days {
    
    let date: String
    let day: String
}
class DoctorDatesTableViewCell: UITableViewCell {
    static let identifier = "DoctorDatesTableViewCell"
    
    var lastSelected: IndexPath?
    
    var workingDays: [Next7Days] = []
	
	var delegate: DoctorDatesTableViewCellDelegate?
    
    private let datesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 100)
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(DoctorDatesCollectionViewCell.self, forCellWithReuseIdentifier: DoctorDatesCollectionViewCell.identifier)
        view.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
//        let endOfWeek = Calendar.current.date(byAdding: .day, value: 7, to: Date())
//
//        print(Date())
//        print(endOfWeek)
        contentView.addSubview(datesCollectionView)
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        DispatchQueue.main.async { [self] in
            getNext7WorkingDays()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                datesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                datesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                datesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                datesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                datesCollectionView.heightAnchor.constraint(equalToConstant: 100),
                datesCollectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ]
        )
    }
    
    public func configure() {
        layoutSubviews()
    }
    
}
extension DoctorDatesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorDatesCollectionViewCell.identifier, for: indexPath) as? DoctorDatesCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.borderColor = UIColor.label.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        if workingDays.count == 7 {
            cell.configure(date: workingDays[indexPath.row].date, day: workingDays[indexPath.row].day)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let lastSelected = lastSelected {
            let cell = collectionView.cellForItem(at: lastSelected)
            cell?.backgroundColor = .clear
            cell?.layer.borderColor = UIColor.label.cgColor
            cell?.layer.borderWidth = 1
        }
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .green
        lastSelected = indexPath
		delegate?.clickedOnDateButton(dateOffset: (Int(workingDays[indexPath.row].date) ?? 0))
    }
    
    func getNext7WorkingDays() {
        let calendar = Calendar(identifier: Calendar.Identifier.indian)
        var todayDate = Date()
        let dateFromatterDate = DateFormatter()
        dateFromatterDate.setLocalizedDateFormatFromTemplate("d")
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.setLocalizedDateFormatFromTemplate("EEE")
        if !calendar.isDateInWeekend(todayDate) {
            workingDays.append(Next7Days(date: dateFromatterDate.string(from: todayDate), day: dateFormatterDay.string(from: todayDate)))
        }
        while workingDays.count < 7 {
            todayDate = calendar.date(byAdding: Calendar.Component.day, value: 1, to: todayDate)!
            if !calendar.isDateInWeekend(todayDate) {
                workingDays.append(Next7Days(date: dateFromatterDate.string(from: todayDate), day: dateFormatterDay.string(from: todayDate)))
            }
        }
        DispatchQueue.main.async {
            self.datesCollectionView.reloadData()
        }
    }
}
