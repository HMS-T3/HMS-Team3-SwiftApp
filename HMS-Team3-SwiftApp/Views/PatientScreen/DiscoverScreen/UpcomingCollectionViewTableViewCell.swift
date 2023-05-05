//
//  UpcomingCollectionViewTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import UIKit

//struct DocInfo{
//    let docName: String
//    let docSpecialization: String
//    let docImage: UIImage?
//}

class UpcomingCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "UpcomingCollectionViewTableViewCell"
    
    private var upcomingDetails: [UpcomingResponse] = [UpcomingResponse]()
    
    var delegate: DiscoverCollectionViewDelegate?
    
//    let upcomingInfo: [DocInfo] = [DocInfo(docName: "Y.S. Reddy", docSpecialization: "Cardiologist", docImage: UIImage(named: "doc.male")),
//        DocInfo(docName: "K. Singh", docSpecialization: "Neurologist", docImage: UIImage(named: "doc.male"))
//    ]
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 320, height: 170)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.identifier)
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

    public func configure(with upcomingDetails: [UpcomingResponse]){
        self.upcomingDetails = upcomingDetails
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension UpcomingCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        upcomingDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(named: "upcoming.card")
        cell.layer.cornerRadius = 10
//        cell.configure(with: upcomingInfo[indexPath.row])
        cell.configure(with: upcomingDetails[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedOnUpcomingCell()
    }
}

extension UpcomingCollectionViewTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
