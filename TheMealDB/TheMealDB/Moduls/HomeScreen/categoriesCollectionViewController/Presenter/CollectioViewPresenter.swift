//
//  CollectionViewPresenter.swift
//  TheMealDB
//
//  Created by mac on 11/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

protocol CollectioViewPresenter {
    var numberOfItem: Int { get }
    func register(customCollec: UICollectionView)
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class CategoriesPresenterImplement: CollectioViewPresenter {
    private let arr = Resource.Images.arrCategories
    
    
    func register(customCollec: UICollectionView) {
        let nibName = UINib(nibName: "CategoriesViewCell", bundle: nil)
        customCollec.register(nibName, forCellWithReuseIdentifier: "CategoriesViewCell")
    }
    
    var numberOfItem: Int {
        return arr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesViewCell", for: indexPath) as? CategoriesViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: Resource.Images.meatTacos ?? UIImage())
        return cell
    }
}
