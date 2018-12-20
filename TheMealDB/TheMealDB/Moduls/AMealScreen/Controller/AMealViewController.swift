//
//  AMealViewController.swift
//  TheMealDB
//
//  Created by mac on 12/20/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

struct ConstantsIdentifier {
    static let identifier = "IngredientsCell"
}

class AMealViewController: BaseViewController {
    //  MARK: - UI Element
    @IBOutlet private weak var foodImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var areaLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var textView: UITextView!
    
    //  MARK: - Properties
    var meal: Meal?
    var ingredients = [FoodResource]()
    
    //  MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        configView()
    }
    
    override func initialize() {
        super.initialize()
        initTableView()
    }

    //  MARK: - Setup Action
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    private func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nibName = UINib(nibName: ConstantsIdentifier.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ConstantsIdentifier.identifier)
    }
    
    private func configView() {
        let urlFood = URL(string: meal?.strMealThumb ?? "")
        foodImage.sd_setImage(with: urlFood, completed: nil)
        categoryLabel.text = meal?.strCategory
        categoryLabel.font = .helveticaNeue(fontSize: 10)
        categoryLabel.textColor = Theme.sharedInstance.gray9E9E9E
        nameLabel.text = meal?.strMeal
        nameLabel.font = .helveticaNeue(fontSize: 20)
        idLabel.text = meal?.idMeal
        areaLabel.text = meal?.strArea
        textView.text = meal?.strInstructions
        ingredients = meal?.resources ?? [FoodResource]()
    }
}

extension AMealViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsIdentifier.identifier) as? IngredientsCell else {
            return UITableViewCell()
        }
        let data = "\(ingredients[indexPath.row].measure) \(ingredients[indexPath.row].ingredient)"
        cell.configuage(data: data)
        return cell
    }
}
