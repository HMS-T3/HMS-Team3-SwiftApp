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
                timeSlotsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
                timeSlotsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                timeSlotsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                timeSlotsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                timeSlotsCollectionView.heightAnchor.constraint(equalToConstant: 70*5)
            ]
        )
        
        let itemWidthSize = contentView.bounds.width / 3
        let layout = timeSlotsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidthSize - 20, height: 70)
    }
    
    public func configure() {
        layoutSubviews()
    }
    
}
extension DoctorTimeSlotsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorTimeSlotsCollectionViewCell.identifier, for: indexPath)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.label.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let lastSelected = lastSelected {
            
            let cell = collectionView.cellForItem(at: lastSelected)
            cell?.backgroundColor = .clear
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor.label.cgColor
        }
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .green
        lastSelected = indexPath
    }
}
