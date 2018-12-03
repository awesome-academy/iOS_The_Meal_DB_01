//
//  TableViewPresenter.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewPresenter {
    var numberOfItem: Int { get }
    var rowHeight: CGFloat { get }
    func register(tableView: UITableView)
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

public class CategoryPresenterImplement: TableViewPresenter {
    var numberOfItem: Int {
        return 3
    }
    
    var rowHeight: CGFloat {
        return 232
    }
    
    func register(tableView: UITableView) {
        let nibName = UINib(nibName: "CategoryViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CategoryViewCell")
    }

    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell") as? CategoryViewCell else {
            return UITableViewCell()
        }
        cell.configuage(data: Resource.Images.meatTacos!)
        return cell
    }
}
