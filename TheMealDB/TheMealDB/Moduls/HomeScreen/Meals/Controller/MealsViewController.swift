//
//  MealsCollectionViewController.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

private struct ConfigCollectionCell {
    static let height = Dimension.sharedInstance.heightTableViewCell
    static let minimumLineSpacingForSection: CGFloat = 16
}

class MealsCollectionViewController: UICollectionView {
    //  MARK: - Properties
    var meals = [Meal]()
    var filterMeals = [Meal]() {
        didSet {
            self.reloadData()
        }
    }
    weak var customDelegate: CustomCollectionViewDelegate?
    
    //  MARK: - Setup Views
    override func draw(_ rect: CGRect) {
        initCollectionView()
        loadData()
    }
    
    private func initCollectionView() {
        self.dataSource = self
        self.delegate = self
        let nibName = UINib(nibName: "MealCell", bundle: nil)
        self.register(nibName, forCellWithReuseIdentifier: "MealCell")
    }
    
    //  MARK: - Data
    func loadData() {
        let mealRepository: MealRepository = MealRepositoryImp(api: APIService.share)
        mealRepository.getMeal { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let meal):
                guard let meals = meal?.meals else {
                    return
                }
                self.meals = meals
                self.filterMeals = meals
            case .failure(let error):
                guard let error = error else {
                    return
                }
                self.showErrorAlert(error: error)
            }
        }
    }
    //  MARK: - Action
    private func showErrorAlert(error: BaseError) {
        self.customDelegate?.showAlert(error: error)
    }
    
    private func showAMealScreen(meal: Meal) {
        self.customDelegate?.showAMeal(meal: meal)
    }
}

extension MealsCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCell", for: indexPath) as? MealCell else {
            return UICollectionViewCell()
        }
        cell.configuage(data: filterMeals[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showAMealScreen(meal: filterMeals[indexPath.row])
    }
}

extension MealsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: ConfigCollectionCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return ConfigCollectionCell.minimumLineSpacingForSection
    }
}

