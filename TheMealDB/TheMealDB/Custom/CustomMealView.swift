//
//  CustomMealItem.swift
//  TheMealDB
//
//  Created by mac on 11/30/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

public final class CustomMealView: BaseUIView {
    // MARK: - Properties 
    public var categoryText: String = String() {
        didSet {
            categoryLabel.text = categoryText
        }
    }
    
    public var mealText: String = String() {
        didSet {
            mealLabel.text = mealText
        }
    }
    
    public var idMealText: String = String() {
        didSet {
            idMealLabel.text = idMealText
        }
    }
    
    public var areaText: String = String() {
        didSet {
            areaLabel.text = areaText
        }
    }
    
    //  MARK: - UI Element
    var mealThumbImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .helveticaNeue(fontSize: 10)
        label.textColor = Theme.sharedInstance.gray9E9E9E
        return label
    }()
    
    private let mealLabel: UILabel = {
        let label = UILabel()
        label.font = .helveticaNeue(fontSize: 16)
        return label
    }()
    
    private let idMealImage: UIImageView = {
        let image = UIImageView()
        image.image = Resource.Images.idMealImage
        return image
    }()
    
    private let idMealLabel: UILabel = {
        let label = UILabel()
        label.font = .helveticaNeue(fontSize: 13)
        label.textColor = Theme.sharedInstance.gray9E9E9E
        return label
    }()
    
    private let areaImage: UIImageView = {
        let image = UIImageView()
        image.image = Resource.Images.areaImage
        return image
    }()
    
    private let areaLabel: UILabel = {
        let label = UILabel()
        label.font = .helveticaNeue(fontSize: 13)
        label.textColor = Theme.sharedInstance.gray9E9E9E
        return label
    }()
    
    //  MARK: - Life Cycle
    override func initialize() {
        super.initialize()
        setUpMealThumbImageImage()
        setUpCategoryLabel()
        setUpMealLabel()
        setUpIDMealImage()
        setUpIDMealLabel()
        setUpAreaImage()
        setUpAreaLabel()
    }

    //  MARK: - Set Up View
    private func setUpMealThumbImageImage() {
        addSubview(mealThumbImage)
        mealThumbImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(Dimension.sharedInstance.height_128)
        }
    }

    private func setUpCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealThumbImage.snp.bottom).offset(Dimension.sharedInstance.verticalMargin_8)
            make.left.equalToSuperview().offset(Dimension.sharedInstance.horizontalMargin_16)
            make.height.equalTo(Dimension.sharedInstance.height_24)
        }
    }

    private func setUpMealLabel() {
        addSubview(mealLabel)
        mealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(categoryLabel.snp.bottom)
            make.left.height.equalTo(categoryLabel)
        }
    }

    private func setUpIDMealImage() {
        addSubview(idMealImage)
        idMealImage.snp.makeConstraints { (make) in
            make.top.equalTo(mealLabel.snp.bottom).offset(Dimension.sharedInstance.verticalMargin_8)
            make.left.equalTo(categoryLabel)
            make.width.equalTo(Dimension.sharedInstance.width_24)
            make.height.equalTo(Dimension.sharedInstance.height_24)
        }
    }

    private func setUpIDMealLabel() {
        addSubview(idMealLabel)
        idMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idMealImage)
            make.left.equalTo(idMealImage.snp.right).offset(Dimension.sharedInstance.horizontalMargin_16)
            make.height.equalTo(idMealImage)
        }
    }

    private func setUpAreaImage() {
        addSubview(areaImage)
        areaImage.snp.makeConstraints { (make) in
            make.top.equalTo(idMealImage)
            make.left.equalTo(idMealLabel.snp.right).offset(Dimension.sharedInstance.horizontalMargin_32)
            make.width.height.equalTo(idMealImage)
        }
    }

    private func setUpAreaLabel() {
        addSubview(areaLabel)
        areaLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idMealImage)
            make.left.equalTo(areaImage.snp.right).offset(Dimension.sharedInstance.horizontalMargin_16)
            make.height.equalTo(idMealImage)
        }
    }
}

