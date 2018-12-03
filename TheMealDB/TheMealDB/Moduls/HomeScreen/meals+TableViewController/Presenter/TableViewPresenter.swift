//
//  TableViewPresenter.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

struct ConstantTableView {
    static let numberOfItem = 2
    static let rowHeight: CGFloat = Dimension.sharedInstance.height_232
}

protocol TableViewPresenter {
    var numberOfItem: Int { get }
    var rowHeight: CGFloat { get }
    func register(tableView: UITableView)
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

public class TableViewPresenterImplement: TableViewPresenter {
    var numberOfItem: Int {
        return ConstantTableView.numberOfItem
    }
    
    var rowHeight: CGFloat {
        return ConstantTableView.rowHeight
    }
    
    func register(tableView: UITableView) {
        let nibName = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CustomTableViewCell")
    }

    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.Configuage(data: Resource.Images.meatTacos ?? UIImage())
        return cell
    }
}
