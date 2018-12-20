//
//  IngredientsCell.swift
//  TheMealDB
//
//  Created by mac on 12/20/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {
    @IBOutlet weak var foodResource: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuage(data: String) {
        foodResource.text = data
        foodResource.font = .helveticaNeue(fontSize: 14)
    }
}
