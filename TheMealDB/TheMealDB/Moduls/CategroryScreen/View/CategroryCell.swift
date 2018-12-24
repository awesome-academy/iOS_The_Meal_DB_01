//
//  CategroryCell.swift
//  TheMealDB
//
//  Created by mac on 12/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategroryCell: UITableViewCell {
    @IBOutlet weak var categroryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuage(data: CategroryItem) {
        categroryName.text = data.strCategory
    }
}
