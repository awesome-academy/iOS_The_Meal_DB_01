//
//  CattegroryController.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

private struct ConfigCollectionCell {
    static let height = Dimension.sharedInstance.heightCategroryCell
}

class CategoryController: UIViewController {
    //  MARK: - UI Element
    @IBOutlet weak private var collectionView: UICollectionView!
    
    //  MARK: - Properties
    private var categories = [CategroryItem]()
    private var filterCategories = [CategroryItem]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    private var meals = [Meal]()
    private let searchBar = UISearchBar()
    
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        loadData()
        setUpNavigationBar()
    }
    
    //  MARK: - Setup View
    private func initCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nibName = UINib(nibName: "CategroryCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "CategroryCell")
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
                let alertController = UIAlertController(title: "Error", message: error?.errorMessage, preferredStyle: .alert)
                let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAlertButton)
                self.present(alertController, animated: true, completion: nil)
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
                let alertController = UIAlertController(title: "Error", message: error?.errorMessage, preferredStyle: .alert)
                let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAlertButton)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = Resource.Navigation.categoriesTitle
        let searchBarButton = UIBarButtonItem(image: Resource.Images.searchImage,
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategroryCell", for: indexPath) as? CategroryCell else {
            return UICollectionViewCell()
        }
        cell.configuage(data: filterCategories[indexPath.row])
        return cell
    }
}

extension CategoryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2 - 5, height: ConfigCollectionCell.height)
    }
}
