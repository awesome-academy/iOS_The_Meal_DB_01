//
//  AMealViewController.swift
//  TheMealDB
//
//  Created by mac on 12/20/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import CoreData

final class AMealViewController: BaseViewController {
    private struct ConfigureTableView {
        static let numberOfSections = 2
    }
    
    private struct ConfigureHeader {
        static let firstTitle = "INGREDIENTS"
        static let secondTitle = "INSTRUCTIONS"
        static let heightForHeaderInSection: CGFloat = 50
    }
    
    private struct ConfigureCell {
        static let identifierBody = "IngredientsCell"
        static let identifierHead = "MealCell"
        static let identifierFoot = "FootCell"
        static let heightBodyCell = Dimension.sharedInstance.heightIngredientsCell
    }
    
    //  MARK: - UI Element
    @IBOutlet weak private var aMealTableView: UITableView!
    
    //  MARK: - Properties
    var ingredients = [FoodResource]()
    var instructions = [String]()
    var meal = Meal() {
        didSet {
            self.ingredients = meal.resources
            let replaceString = meal.strInstructions.replacingOccurrences(of: "\r\n", with: "", options: .literal, range: nil)
            let replaceString2 = replaceString.replacingOccurrences(of: ". ", with: ".", options: .literal, range: nil)
            self.instructionArray = replaceString2.components(separatedBy: ".")
        }
    }
    private let dbManager = DBManager()
    private var flagFavorite: Bool?
    
    //  MARK: - Life Cycle
    override func initialize() {
        super.initialize()
        initTableView()
        setUpNavigationBar()
        setupHeaderTableView()
        findMealInCoreData()
    }
    
    //  MARK: - Core Data
    private func findMealInCoreData() {
        let mealsCoreData = dbManager.getMeals()
        for item in mealsCoreData {
            if meal.strMeal == item.strMeal {
                setFavoriteFull()
                return
            }
        }
        setFavoriteEmpty()
    }
    
    //  MARK: - Setup Action
    private func initTableView() {
        aMealTableView.estimatedRowHeight = 100
        aMealTableView.rowHeight = UITableViewAutomaticDimension
        aMealTableView.dataSource = self
        aMealTableView.delegate = self
        let nibNameBody = UINib(nibName: ConfigureCell.identifierBody, bundle: nil)
        aMealTableView.register(nibNameBody, forCellReuseIdentifier: ConfigureCell.identifierBody)
        let nibNameFoot = UINib(nibName: ConfigureCell.identifierFoot, bundle: nil)
        aMealTableView.register(nibNameFoot, forCellReuseIdentifier: ConfigureCell.identifierFoot)
    }
    
    private func setupHeaderTableView() {
        let nibNameBody = UINib(nibName: ConfigureCell.identifierHead, bundle: nil)
        aMealTableView.register(nibNameBody, forCellReuseIdentifier: ConfigureCell.identifierHead)
        guard let headerCell = aMealTableView.dequeueReusableCell(withIdentifier: ConfigureCell.identifierHead) as? MealCell else {
            return
        }
        headerCell.configuge(data: meal)
        headerCell.setupLabelsAlignmentCenter()
        aMealTableView.tableHeaderView = headerCell
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "Meal"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let backBarButton = UIBarButtonItem(image: Resource.Images.backButton?.withRenderingMode(.alwaysOriginal),
                                            style: .plain,
                                            target: self,
                                            action: #selector(backToPrevious))
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    @objc func backToPrevious() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func favoriteButtonTapped() {
        if !flagFavorite {
            setFavoriteFull()
        } else {
            setFavoriteEmpty()
        }
    }
    
    private func setFavoriteEmpty() {
        let favoriteBlackBoder = UIBarButtonItem(image: Resource.Images.favoriteBlackBoder?.withRenderingMode(.alwaysOriginal),
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(favoriteButtonTapped))
        self.navigationItem.rightBarButtonItem = favoriteBlackBoder
        flagFavorite = false
    }
    
    private func setFavoriteFull() {
        let favoriteBlackBoder = UIBarButtonItem(image: Resource.Images.heartOrange?.withRenderingMode(.alwaysOriginal),
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(favoriteButtonTapped))
        self.navigationItem.rightBarButtonItem = favoriteBlackBoder
        flagFavorite = true
        dbManager.saveDataAction()
    }
}

extension AMealViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? ingredients.count : instructionArray.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConfigureCell.identifierBody, for: indexPath) as? IngredientsCell else {
                return UITableViewCell()
            }
            cell.configuage(data: ingredients[indexPath.row])
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConfigureCell.identifierFoot, for: indexPath) as? FootCell else {
            return UITableViewCell()
        }
        cell.configure(data: instructionArray[indexPath.row], numerical: indexPath.row + 1)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConfigureTableView.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ConfigureHeader.firstTitle
        case 1:
            return ConfigureHeader.secondTitle
        default:
            break
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ConfigureHeader.heightForHeaderInSection
    }
}
