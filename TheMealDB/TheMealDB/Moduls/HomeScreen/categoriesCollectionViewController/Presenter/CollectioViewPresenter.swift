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
    func collectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class CategoriesPresenterImplement: CollectioViewPresenter {
    public var categroriesArray = [CategroryItem]()
    
    public func register(customCollec: UICollectionView) {
        let nibName = UINib(nibName: "CategoriesViewCell", bundle: nil)
        customCollec.register(nibName, forCellWithReuseIdentifier: "CategoriesViewCell")
    }
    
    var numberOfItem: Int {
        return categroriesArray.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesViewCell", for: indexPath) as? CategoriesViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(categoryItem: categroriesArray[indexPath.row])
        return cell
    }
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: - TODO
    }
}
