//
//  CattegroryController.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoryController: BaseViewController {
    private struct Constants {
        static let cellHeight = Dimension.sharedInstance.heightCategroryCellSecond
        static let nibName = "CategoryCellSecond"
    }
    
    //  MARK: - UI Element
    @IBOutlet weak private var collectionView: UICollectionView!
    
    //  MARK: - Properties
    private var categories = [Categrory]()
    private var filterCategories = [Categrory]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    private var meals = [Meal]()
    private let searchBar = UISearchBar()
    
    //  MARK: - Life Cycle
    override func initialize() {
        super.initialize()
        initCollectionView()
        loadData()
        setUpNavigationBar()
    }
    
    //  MARK: - Setup View
    private func initCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nibName = UINib(nibName: Constants.nibName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: Constants.nibName)
        collectionView.backgroundColor = .clear
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
                self.categories = category
                self.filterCategories = category
            case .failure(let error):
                guard let error = error else {
                    return
                }
                self.showErrorAlert(error: error)
            }
        }
        let mealRepository: MealRepository = MealRepositoryImp(api: APIService.share)
        mealRepository.getMeal { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let meal):
                guard let meals = meal?.meals else {
                    return
                }
                self.meals = meals
            case .failure(let error):
                guard let error = error else {
                    return
                }
                self.showErrorAlert(error: error)
            }
        }
    }
    
    private func showErrorAlert(error: BaseError) {
        let alertController = UIAlertController(title: "Error", message: error.errorMessage, preferredStyle: .alert)
        let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAlertButton)
        present(alertController, animated: true, completion: nil)
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = Resource.Navigation.categoriesTitle
        let searchBarButton = UIBarButtonItem(image: Resource.Images.searchButton?.withRenderingMode(.alwaysOriginal),
                                              style: .plain,
                                              target: self, action: #selector(setUpSearchBar))
        self.navigationItem.rightBarButtonItem = searchBarButton
    }
    
    @objc func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search Categrory"
        self.navigationItem.titleView = searchBar
    }
}

extension CategoryController: UISearchBarDelegate {
    //  MARK: - Setup Action
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty == false else {
            filterCategories = categories
            return
        }
        filterCategories = categories
            .filter { category -> Bool in
                guard let text = searchBar.text else {
                    return false
                }
                return (category.strCategory.contains(text))
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.titleView = nil
        filterCategories = categories
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

extension CategoryController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nibName, for: indexPath) as? CategoryCellSecond else {
            return UICollectionViewCell()
        }
        cell.configure(data: filterCategories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var mealsOfACategrory = [Meal]()
        for item in meals {
            if item.strCategory == categories[indexPath.row].strCategory {
                mealsOfACategrory.append(item)
            }
        }
        let allMealOfCategrory = AllMealOfCategrory()
        allMealOfCategrory.category = filterCategories[indexPath.row]
        allMealOfCategrory.mealsOfACategrory = mealsOfACategrory
        let navigationAllmealController = UINavigationController(rootViewController: allMealOfCategrory)
        present(navigationAllmealController, animated: true, completion: nil)
    }
}

extension CategoryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: Constants.cellHeight)
    }
}
