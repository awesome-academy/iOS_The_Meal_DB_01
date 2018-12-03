//
//  HomeViewController.swift
//  TheMealDB
//
//  Created by mac on 11/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //  MARK: UI Element
    private let featuredRecipesLabel: UILabel = {
        let label = UILabel()
        label.text = Resource.Label.featuredRecipesTitle
        label.font = UIFont(name: Resource.Font.HelveticaNeue, size: Dimension.sharedInstance.captionFontSize_14)
        return label
    }()
    
    private let collecView = CustomCollectionViewController()
    
    private let lastestLabel: UILabel = {
        let label = UILabel()
        label.text = Resource.Label.lastestTitle
        label.font = UIFont(name: Resource.Font.HelveticaNeue, size: Dimension.sharedInstance.captionFontSize_14)
        return label
    }()
    
    private let tableView = CustomTableViewController()
    
    //  MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = Resource.Navigation.homeTitle
        let alertButton = UIBarButtonItem(image: Resource.Images.alertButton,
                                          style: .plain,
                                          target: self,
                                          action: #selector(AlertAction))
        self.navigationItem.leftBarButtonItem = alertButton
        let searchButton = UIBarButtonItem(image: Resource.Images.searchButton,
                                          style: .plain,
                                          target: self,
                                          action: #selector(SearchAction))
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    override func initialize() {
        super.initialize()
        setUpFeaturedRecipesLabel()
        setUpCollectionView()
        setUpLastestLabel()
        setUpTableView()
    }
    
    //  MARK: SetUp View
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
    
    
    //  MARK: SetUp Action
    @objc func AlertAction() {
        print("Alert")
    }
    
    @objc func SearchAction() {
        print("Search")
    }
}
