//
//  ViewController.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController {
    private struct Constants {
        static let nibName = "CategroryCell"
    }
    
    @IBOutlet weak private var customCollectionView: UICollectionView!
    
    private var categoryArray = [Categrory]() {
        didSet {
            self.customCollectionView.reloadData()
        }
    }
    
    override func initialize() {
        super.initialize()
        customCollectionView.backgroundColor = .clear
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
            case .failure(let error):
                let alertController = UIAlertController(title: "Error", message: error?.errorMessage, preferredStyle: .alert)
                let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAlertButton)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func register() {
        let nibName = UINib(nibName: Constants.nibName, bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: Constants.nibName)
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nibName, for: indexPath) as? CategroryCell else {
            return UICollectionViewCell()
        }
        cell.configuage(data: categoryArray[indexPath.row])
        return cell
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
    static let width = Dimension.sharedInstance.collectionViewCellWidth
    static let height = Dimension.sharedInstance.collectionViewCellHeight
}
