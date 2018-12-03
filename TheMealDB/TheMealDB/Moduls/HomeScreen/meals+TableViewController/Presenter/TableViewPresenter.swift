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
    func register(tableView: UITableView)
    var numberOfItem: Int { get }
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    var rowHeight: CGFloat { get }
}

public class TableViewPresenterImplement: TableViewPresenter {
    
    private let mang = ["ABC", "XYZ", "ABC", "XYZ", "ABC", "XYZ", "ABC", "XYZ", "ABC", "XYZ", "ABC", "XYZ"]
    
    func register(tableView: UITableView) {
        let nibName = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "Cell")
    }
    
    var numberOfItem: Int {
        return 2
    }

    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.Configuage(data: Resource.Images.meatTacos ?? UIImage())
        return cell
    }
    
    var rowHeight: CGFloat {
        return Dimension.sharedInstance.height_232
    }
}
