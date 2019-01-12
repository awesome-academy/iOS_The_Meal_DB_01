//
//  customTableViewController.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class MealsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var meals = [Meal]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func initialize() {
        super.initialize()
        tableView.dataSource = self
        tableView.delegate = self
        initView()
        loadData()
    }
    
    private func initView() {
        let nibName = UINib(nibName: "MealCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "MealCell")
    }
    
    private func loadData() {
        let mealRepository: MealRepository = MealRepositoryImp(api: APIService.share)
        mealRepository.getMeal { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let meal):
                guard let meal = meal?.meals else {
                    return
                }
                self.meals = meal
            case .failure(let error):
                let alertController = UIAlertController(title: "Error", message: error?.errorMessage, preferredStyle: .alert)
                let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAlertButton)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}

extension MealsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealCell else {
            return UITableViewCell()
        }
        cell.configuage(data: meals[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Dimension.sharedInstance.height_232
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aMealViewController = AMealViewController()
        aMealViewController.meal = meals[indexPath.row]
        present(aMealViewController, animated: true, completion: nil)
    }
}
