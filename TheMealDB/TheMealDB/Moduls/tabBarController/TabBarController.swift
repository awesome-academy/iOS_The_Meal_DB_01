//
//  TabBarController.swift
//  Test
//
//  Created by mac on 11/28/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    //  MARK: - Properties
    private let homeVC = HomeViewController()
    private let categroryVC = CategoryController()
    
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    //  MARK: - Setup Action
    func setUpTabBar() {
        homeVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.homeGrey, selectedImage: Resource.Images.homeOrange)
        let navigationHomeController = UINavigationController(rootViewController: homeVC)
        categroryVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.kindGrey, selectedImage: Resource.Images.kindOrange)
        let navigationCategoryController = UINavigationController(rootViewController: categroryVC)
        viewControllers = [navigationHomeController, navigationCategoryController]
    }
}

