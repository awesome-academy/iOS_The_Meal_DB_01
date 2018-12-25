//
//  CustomTableViewCell.swift
//  TheMealDB
//
//  Created by mac on 11/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class MealCell: UICollectionViewCell {
    //  MARK: - UI Element
    @IBOutlet weak private var mealImage: UIImageView!
    @IBOutlet weak private var blurView: UIVisualEffectView!
    @IBOutlet weak private var categoryName: UILabel!
    @IBOutlet weak private var mealName: UILabel!
    @IBOutlet weak private var mealID: UILabel!
    @IBOutlet weak private var mealArea: UILabel!
    
    //  MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    //  MARK: - Configuage
    func configuage(data: Meal) {
        guard let url = URL(string: data.strMealThumb) else {
            return
        }
        mealImage.sd_setImage(with: url, completed: nil)
        categoryName.text = data.strCategory
        mealName.text = data.strMeal
        mealID.text = data.idMeal
        mealArea.text = data.strArea
    }
    
    //  MARK: - Configuage
    private func setupViews() {
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupBlurView()
        setupCategoryName()
        setupMealName()
        setupMealID()
        setupMealArea()
    }
    
    private func setupBlurView() {
        blurView.layer.cornerRadius = 5
        blurView.clipsToBounds = true
        blurView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blurView.layer.borderWidth = 1
    }
    
    private func setupCategoryName() {
        categoryName.font = .helveticaNeue(fontSize: 15)
    }
    
    private func setupMealName() {
        mealName.font = .helveticaNeue(fontSize: 20)
    }
    
    private func setupMealID() {
        mealID.font = .helveticaNeue(fontSize: 15)
    }
    
    private func setupMealArea() {
        mealArea.font = .helveticaNeue(fontSize: 15)
    }
}
