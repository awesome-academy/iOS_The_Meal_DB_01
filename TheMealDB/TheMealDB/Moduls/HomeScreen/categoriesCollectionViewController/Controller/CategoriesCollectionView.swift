//
//  ViewController.swift
//  Test
//
//  Created by mac on 11/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

private struct ConfigCollectionCell {
    static let width = Dimension.sharedInstance.collectionViewCellWidth
    static let height = Dimension.sharedInstance.collectionViewCellHeight
    static let minimumLineSpacingForSection: CGFloat = 30
}

class CategoriesCollectionView: UICollectionView {
    //  MARK: - Properties
    private var categoryArray = [Categrory]()
    private var filterCategory = [Categrory]() {
        didSet {
            self.reloadData()
        }
    }
    private var meals = [Meal]()
    weak var customDelegate: CustomCollectionViewDelegate?
    
    //  MARK: - Setup View
    override func draw(_ rect: CGRect) {
        initCollectionView()
        loadData()
        self.backgroundColor = .clear
    }
    
    private func initCollectionView() {
        let nibName = UINib(nibName: "CategroryCell", bundle: nil)
        self.register(nibName, forCellWithReuseIdentifier: "CategroryCell")
        self.dataSource = self
        self.delegate = self
    }
    
    //  MARK: - Data
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
                self.filterCategory = category
            case .failure(let error): print(error as Any)
            }
        }
        let mealRepository: MealRepository = MealRepositoryImp(api: APIService.share)
        mealRepository.getMeal { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let meal):
                guard let meal = meal?.meals else {
                    return
                }
                self.meals = meal
            case .failure(let error): print(error as Any)
            }
        }
    }
    
    //  MARK: - Action
    private func showErrorAlert(error: BaseError) {
        self.customDelegate?.showAlert(error: error)
    }
}

extension CategoriesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategroryCell", for: indexPath) as? CategroryCell else {
            return UICollectionViewCell()
        }
        cell.configuage(data: categoryArray[indexPath.row])
        return cell
    }
}

extension CategoriesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ConfigCollectionCell.width,
                      height: ConfigCollectionCell.height)
    }
}
