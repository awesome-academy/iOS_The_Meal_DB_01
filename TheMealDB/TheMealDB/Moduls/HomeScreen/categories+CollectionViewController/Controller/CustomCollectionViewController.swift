//
//  ViewController.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CustomCollectionViewController: BaseViewController {
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    private var collectionPresenter = CollectionPresenterImplement()

    override func initialize() {
        super.initialize()
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        collectionPresenter.register(customCollec: customCollectionView)
        let flowLayout = UICollectionViewFlowLayout()
        customCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        flowLayout.scrollDirection = .horizontal
    }
}

extension CustomCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPresenter.numberOfItem
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionPresenter.collectionView(collectionView: customCollectionView,
                                                  cellForItemAt: indexPath)
    }
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Dimension.sharedInstance.collectionViewCellWidth,
                      height: Dimension.sharedInstance.collectionViewCellHeight)
    }
}
