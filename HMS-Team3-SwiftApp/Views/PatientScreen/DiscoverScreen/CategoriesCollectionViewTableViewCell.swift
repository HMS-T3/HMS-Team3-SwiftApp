//
//  CategoriesCollectionViewTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 25/04/23.
//

import UIKit

class CategoriesCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CategoriesCollectionViewTableViewCell"
    
    var delegate: ClickCollectionViewDelegate?
//    var categories: [Specialization]
    
//    func configureCategory(_ category: [Specialization]){
//        categories = category
//        categoryInfo =  categories.map { value in Categories(categoryImage: value.imgUrl, categoryName: value.specialization)
//        }
//    }
    
    let categoryInfo: [Categories] = [
           Categories(categoryImage: UIImage(named: "General"), categoryName: CategoryTypes.general),
           Categories(categoryImage: UIImage(named: "Lung Specialist"), categoryName: CategoryTypes.lungSpecialist),
           Categories(categoryImage: UIImage(named: "Dentist"), categoryName: CategoryTypes.dentist),
           Categories(categoryImage: UIImage(named: "Psychiatrist"), categoryName: CategoryTypes.psychiatrist),
           Categories(categoryImage: UIImage(named: "Covid19"), categoryName: CategoryTypes.covid19),
           Categories(categoryImage: UIImage(named: "Surgeon"), categoryName: CategoryTypes.surgeon),
           Categories(categoryImage: UIImage(named: "Cardiologist"), categoryName: CategoryTypes.cardiologist),
           Categories(categoryImage: UIImage(named: "Neurologist"), categoryName: CategoryTypes.neurologist)
       ]
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 35, height: 35)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        self.categories =  [Specialization(specialization: "hello", description: "hi", imgUrl: "ok")]
//        self.categoryInfo = categories.map { value in
//            Categories(categoryImage: "value.imgUrl", categoryName: "value.specialization")
//        }
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

extension CategoriesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell()}
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = UIColor.black.cgColor
        cell.configure(with: categoryInfo[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedOnCategoryCell()
    }
}

extension CategoriesCollectionViewTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameWidth = UIScreen.main.bounds.width
        collectionView.frame.size.width = frameWidth
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth/4 - 15, height: cellWidth/4 - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}




