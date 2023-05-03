//
//  MedicineCollectionViewTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import UIKit

struct OngoingMedicineInfo{
    let name: String
    let dosageMorning: String
    let dosageAfternoon: String
    let dosageEvening: String
}

class MedicineCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "MedicineCollectionViewTableViewCell"
    
    let ongoingMedicine: [OngoingMedicineInfo] = [OngoingMedicineInfo(name: "Ascoril D", dosageMorning: "Dosage1", dosageAfternoon: "Dosage2", dosageEvening: "Dosage3"),
        OngoingMedicineInfo(name: "Calpol 650", dosageMorning: "Dosage1", dosageAfternoon: "Dosage2", dosageEvening: "Dosage3")
    ]
    var delegate: DiscoverCollectionViewDelegate?
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 130)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MedicineCollectionViewCell.self, forCellWithReuseIdentifier: MedicineCollectionViewCell.identifier)
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension MedicineCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ongoingMedicine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MedicineCollectionViewCell.identifier, for: indexPath) as? MedicineCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(named: "ongoingmeds.card")
        cell.layer.cornerRadius = 10
        cell.configure(with: ongoingMedicine[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedOnMedicationsCell()
    }
    
}

extension MedicineCollectionViewTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
