//
//  TopSellingTestsTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 30/04/23.
//

import UIKit

class TopSellingTestsTableViewCell: UITableViewCell {
    
    static let identifier = "TopSellingTestsTableViewCell"
    
    var delegate: PackagesCollectionViewDelegate?
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 220)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TopSellingCollectionViewCell.self, forCellWithReuseIdentifier: TopSellingCollectionViewCell.identifier)
        cv.backgroundColor = UIColor(named: "gray.shadow")
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

extension TopSellingTestsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopSellingCollectionViewCell.identifier, for: indexPath) as? TopSellingCollectionViewCell else { return UICollectionViewCell()}
        cell.backgroundColor = UIColor(named: "secondary")
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedOnTopSellingTestsCell()
    }
}

extension TopSellingTestsTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameWidth = UIScreen.main.bounds.width
        collectionView.frame.size.width = frameWidth
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth/2.5, height: cellWidth/2 - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
