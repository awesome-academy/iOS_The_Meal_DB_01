//
//  HomeViewController2.swift
//  TheMealDB
//
//  Created by mac on 1/4/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //  MARK: - UI Element
    @IBOutlet weak private var categoryLabel: UILabel!
    @IBOutlet weak private var categoryCollectionView: CategoriesCollectionView!
    @IBOutlet weak private var mealLabel: UILabel!
    @IBOutlet weak private var mealCollectionView: MealsCollectionViewController!
    
    //  MARK: - Properties
    private let searchBar = UISearchBar()
    
    //  MARK: - Lyfe Cycle
    override func initialize() {
        super.initialize()
        setupViews()
    }
    
    //  MARK: - Setup Views
    private func setupViews() {
        setupCategoryLabel()
        setupMealLabel()
        setupNavigationBar()
        categoryCollectionView.customDelegate = self
        mealCollectionView.customDelegate = self
    }
    
    private func setupCategoryLabel() {
        categoryLabel.text = ConstantLabel.categoryTitle
        categoryLabel.font = .helveticaNeue(fontSize: 20)
    }
    
    private func setupMealLabel() {
        mealLabel.text = ConstantLabel.mealTitle
        mealLabel.font = .helveticaNeue(fontSize: 20)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = Resource.Navigation.homeTitle
        let alertButton = UIBarButtonItem(image: Resource.Images.alertButton,
                                          style: .plain,
                                          target: self,
                                          action: nil)
        self.navigationItem.leftBarButtonItem = alertButton
        let searchButton = UIBarButtonItem(image: Resource.Images.searchButton?.tinted(with: .white),
                                           style: .plain,
                                           target: self,
                                           action: #selector(setUpSearchBar))
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search Meal"
        self.navigationItem.titleView = searchBar
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty == false else {
            mealCollectionView.filterMeals = mealCollectionView.meals
            return
        }
        mealCollectionView.filterMeals = mealCollectionView.meals
            .filter { meal -> Bool in
                guard let text = searchBar.text else {
                    return false
                }
                return (meal.strMeal.contains(text))
            }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.titleView = nil
        mealCollectionView.filterMeals = mealCollectionView.meals
        searchBar.text = ""
    }
}

extension HomeViewController: CustomCollectionViewDelegate {
    func showAlert(error: BaseError) {
        let alertController = UIAlertController(title: "Error", message: error.errorMessage, preferredStyle: .alert)
        let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAlertButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showCategoryMeal(category: Categrory, mealsOfACategrory: [Meal]) {
        let allMealOfCategrory = AllMealOfCategrory()
        allMealOfCategrory.category = category
        allMealOfCategrory.mealsOfACategrory = mealsOfACategrory
        let navigationAllMealController = UINavigationController(rootViewController: allMealOfCategrory)
        self.present(navigationAllMealController, animated: true, completion: nil)
    }
    
    func showAMeal(meal: Meal) {
        let aMealViewController = AMealViewController()
        aMealViewController.meal = meal
        let navigationAMealController = UINavigationController(rootViewController: aMealViewController)
        self.present(navigationAMealController, animated: true, completion: nil)
    }
}
