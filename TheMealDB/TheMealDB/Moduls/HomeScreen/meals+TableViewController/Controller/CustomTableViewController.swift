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

class CustomTableViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: TableViewPresenter?
    
    override func initialize() {
        super.initialize()
        tableView.dataSource = self
        tableView.delegate = self
        presenter = TableViewPresenterImplement()
        presenter?.register(tableView: tableView)
    }
}

extension CustomTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItem ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.tableView(tableView: tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.rowHeight ?? 0
    }
}
