//
//  TopDocTableViewCell.swift
//  HMS-Team3-SwiftApp
//
//  Created by Abhi Patel on 08/02/1945 Saka.
//

import UIKit

class TopDocTableViewCell: UITableViewCell {
    
    static let identifier = "TopDocTableViewCell"
    
    var delegate: ConsultTabDelegate?
	
	var topDoctorsData: SearchDoctors =  SearchDoctors.init(Response: [SearchResponse]())
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 115, height: 180)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TopDoctorCollectionViewCell.self, forCellWithReuseIdentifier: TopDoctorCollectionViewCell.identifier)
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
		fetchData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
	
	func fetchData() {
		DoctorInformation.shared.getDoctorsBySearching(completion: { results in
			switch results {
			case .success(let response):
				DispatchQueue.main.async {
					self.topDoctorsData = response
					self.collectionView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}, name: "car", filter: "both")
	}

}

extension TopDocTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		topDoctorsData.Response.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopDoctorCollectionViewCell.identifier, for: indexPath) as? TopDoctorCollectionViewCell else { return UICollectionViewCell()}
		cell.layer.borderWidth = 1
		cell.layer.cornerRadius = 10
		cell.layer.borderColor = UIColor(named: "borderConsult")?.cgColor
		cell.configure(with: topDoctorsData.Response[indexPath.row])
		return cell
	}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.clickedTopDoc(doctorID: topDoctorsData.Response[indexPath.row].id)
    }
}

extension TopDocTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
  
}
