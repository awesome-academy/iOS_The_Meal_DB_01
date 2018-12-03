//
//  CollectionViewPresenter.swift
//  TheMealDB
//
//  Created by mac on 11/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionPresenter {
    var numberOfItem: Int { get }
    func register(customCollec: UICollectionView)
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class CollectionPresenterImplement: CollectionPresenter {
    private let arr = Resource.Images.arrCategories
    
    func register(customCollec: UICollectionView) {
        let nibName = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        customCollec.register(nibName, forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
    var numberOfItem: Int {
        return arr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let itemArr = arr[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configure(data: itemArr)
        return cell
    }
}
