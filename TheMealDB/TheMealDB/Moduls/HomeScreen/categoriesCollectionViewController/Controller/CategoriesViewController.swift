//
//  ViewController.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController {
    @IBOutlet weak var customCollectionView: UICollectionView!

    private var collectionPresenter: CollectioViewPresenter!

    override func initialize() {
        super.initialize()
        collectionPresenter = CategoriesPresenterImplement()
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        collectionPresenter.register(customCollec: customCollectionView)
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPresenter.numberOfItem
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionPresenter.collectionView(collectionView: customCollectionView,
                                                  cellForItemAt: indexPath)
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSize.width,
                      height: CellSize.height)
    }
}

struct CellSize {
    static let width = 208
    static let height = 100
}
