//
//  CatTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 08/02/1945 Saka.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    let categoryInfo: [Categories] = [
           Categories(categoryImage: UIImage(named: "Cardiologist01"), categoryName: CategoryTypes.cardiologist),
           Categories(categoryImage: UIImage(named: "Lungs"), categoryName: CategoryTypes.lungSpecialist),
           Categories(categoryImage: UIImage(named: "Dentist01"), categoryName: CategoryTypes.dentist),
           Categories(categoryImage: UIImage(named: "general"), categoryName: CategoryTypes.general),
           Categories(categoryImage: UIImage(named: "covid"), categoryName: CategoryTypes.covid19),
           Categories(categoryImage: UIImage(named: "surgeon"), categoryName: CategoryTypes.surgeon),
           Categories(categoryImage: UIImage(named: "Psychiatrist01"), categoryName: CategoryTypes.psychiatrist),
           Categories(categoryImage: UIImage(named: "brain"), categoryName: CategoryTypes.neurologist)
       ]
    
    static let identifier = "CatTableViewCell"

    var delegate: ConsultTabDelegate?
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 35, height: 35)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
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

extension CatTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: categoryInfo[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.clickedCategory(name: categoryInfo[indexPath.row].categoryName!.rawValue)
    }
}

extension CatTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameWidth = UIScreen.main.bounds.width
        collectionView.frame.size.width = frameWidth
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth/4 - 30, height: cellWidth/4 - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}




