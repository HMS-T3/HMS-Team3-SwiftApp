//
//  PackagesCollectionViewTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 25/04/23.
//

import UIKit

struct PackageInfo {
    let image: UIImage?
    let text: String
    let buttonText: String
}

class PackagesCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "PackagesCollectionViewTableViewCell"
    
    var delegate: ClickCollectionViewDelegate?
    
    var packagesInfo: [PackageInfo] = [PackageInfo(image: UIImage(named: "doctor.male.2"), text: "Book your complete health check-up package now!!", buttonText: "Learn More"),
        PackageInfo(image: UIImage(named: "doctor.male.2"), text: "Get all your medicals tests done today!!", buttonText: "Book Now")
    ]
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 170)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PackagesCollectionViewCell.self, forCellWithReuseIdentifier: PackagesCollectionViewCell.identifier)
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

extension PackagesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PackagesCollectionViewCell.identifier, for: indexPath) as? PackagesCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(named: "packages.card")
        cell.layer.cornerRadius = 10
        cell.configure(with: packagesInfo[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedOnPackagesCell()
    }
    
}

extension PackagesCollectionViewTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
