//
//  CattegroryController.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var categories = [CategroryItem]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        loadData()
    }
    
    private func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nibName = UINib(nibName: "CategroryCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CategroryCell")
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
            case .failure(let error): print(error as Any)
            }
        }
    }
}

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategroryCell") as? CategroryCell else {
            return UITableViewCell()
        }
        cell.configuage(data: categories[indexPath.row])
        return cell
    }
}
