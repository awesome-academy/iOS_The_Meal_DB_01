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
    func register(customCollec: UICollectionView)
    var numberOfItem: Int { get }
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class CollectionPresenterImplement: CollectionPresenter {

    private let Arr = Resource.Images.arrCategories
    
    func register(customCollec: UICollectionView) {
        let nibName = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        customCollec.register(nibName, forCellWithReuseIdentifier: "Cell")
    }
    
    var numberOfItem: Int {
        return Arr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        guard let itemArr = Arr[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configure(data: itemArr)
        return cell
    }
}
