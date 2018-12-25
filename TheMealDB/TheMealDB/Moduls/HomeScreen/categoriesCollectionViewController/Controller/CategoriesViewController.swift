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

    private var categoryArray = [CategroryItem]() {
        didSet {
            self.customCollectionView.reloadData()
        }
    }
 
    override func initialize() {
        super.initialize()
        customCollectionView.backgroundColor = Theme.sharedInstance.placeHolderMessageColor
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        register()
        loadData()
    }
    
    private func loadData() {
        let categoryRepository: CategoryRepository = CategoryRepositoryImp(api: APIService.share)
        categoryRepository.getCategory { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let category):
                guard let category = category?.categories else {
                    return
                }
                self.categoryArray = category
            case .failure(let error): print(error as Any)
            }
        }
    }
    
    private func register() {
        let nibName = UINib(nibName: "CategoriesViewCell", bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: "CategoriesViewCell")
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesViewCell", for: indexPath) as? CategoriesViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(categoryItem: categoryArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: - TODO
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
    static let width = Dimension.sharedInstance.width_208
    static let height = Dimension.sharedInstance.height_100
}
