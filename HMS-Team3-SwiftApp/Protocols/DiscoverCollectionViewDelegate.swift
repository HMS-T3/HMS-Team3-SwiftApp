//
//  CategoryCollectionViewDelegate.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 26/04/23.
//

import Foundation

protocol DiscoverCollectionViewDelegate {
    func clickedOnCategoryCell(name: String)
    func clickedOnUpcomingCell()
    func clickedOnMedicationsCell()
    func clickedOnPackagesCell()
}
