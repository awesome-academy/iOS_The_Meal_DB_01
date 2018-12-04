//
//  HomeViewController.swift
//  TheMealDB
//
//  Created by mac on 11/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //  MARK: - UI Element
    private let featuredRecipesLabel: UILabel = {
        let label = UILabel()
        label.text = ConstantLabel.featuredRecipesTitle
        label.font = .helveticaNeue(fontSize: 14)
        return label
    }()
    
    private let collecView = CategoriesViewController()
    
    private let lastestLabel: UILabel = {
        let label = UILabel()
        label.text = ConstantLabel.lastestTitle
        label.font = .helveticaNeue(fontSize: 14)
        return label
    }()
    
    private let tableView = MealsViewController()
    
    //  MARK: - Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        configView()
    }
    
    override func initialize() {
        super.initialize()
        setUpFeaturedRecipesLabel()
        setUpCollectionView()
        setUpLastestLabel()
        setUpTableView()
    }
    
    //  MARK: - SetUp View
    private func setUpFeaturedRecipesLabel() {
        view.addSubview(featuredRecipesLabel)
        featuredRecipesLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.sharedInstance.verticalMargin_76)
            make.left.equalToSuperview().offset(Dimension.sharedInstance.horizontalMargin_16)
        }
    }
    
    private func setUpCollectionView() {
        view.addSubview(collecView.view)
        collecView.view.snp.makeConstraints { (make) in
            make.top.equalTo(featuredRecipesLabel.snp.bottom).offset(Dimension.sharedInstance.verticalMargin_8)
            make.left.equalTo(featuredRecipesLabel)
            make.right.equalToSuperview().offset(-Dimension.sharedInstance.horizontalMargin_16)
            make.height.equalTo(Dimension.sharedInstance.height_128)
        }
    }
    
    private func setUpLastestLabel() {
        view.addSubview(lastestLabel)
        lastestLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collecView.view.snp.bottom).offset(Dimension.sharedInstance.verticalMargin_24)
            make.left.equalTo(featuredRecipesLabel)
        }
    }
    
    private func setUpTableView() {
        view.addSubview(tableView.view)
        tableView.view.snp.makeConstraints { (make) in
            make.top.equalTo(lastestLabel.snp.bottom).offset(Dimension.sharedInstance.verticalMargin_8)
            make.left.equalTo(featuredRecipesLabel)
            make.right.equalToSuperview().offset(-Dimension.sharedInstance.horizontalMargin_16)
            make.bottom.equalToSuperview()
        }
    }
    
    //  MARK: - SetUp Action
    @objc func alertAction() {
        // MARK: TODO
    }
    
    @objc func searchAction() {
       // MARK: TODO
    }
    
    private func configView() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = Resource.Navigation.homeTitle
        let alertButton = UIBarButtonItem(image: Resource.Images.alertButton,
        style: .plain,
        target: self,
        action: #selector(alertAction))
        navigationItem.leftBarButtonItem = alertButton
        let searchButton = UIBarButtonItem(image: Resource.Images.searchButton,
        style: .plain,
        target: self,
        action: #selector(searchAction))
        navigationItem.rightBarButtonItem = searchButton
    }
}
