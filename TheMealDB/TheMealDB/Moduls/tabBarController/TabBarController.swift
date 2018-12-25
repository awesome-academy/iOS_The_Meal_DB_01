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
        setupTabBar()
    }
    
    //  MARK: - Setup View
    private func setupTabBar() {
        homeVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.homeGrey?.withRenderingMode(.alwaysOriginal), selectedImage: Resource.Images.homeOrange?.withRenderingMode(.alwaysOriginal))
        let navigationHomeController = UINavigationController(rootViewController: homeVC)
        categroryVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.kindGrey?.withRenderingMode(.alwaysOriginal), selectedImage: Resource.Images.kindOrange?.withRenderingMode(.alwaysOriginal))
        let navigationCategoryController = UINavigationController(rootViewController: categroryVC)
        viewControllers = [navigationHomeController, navigationCategoryController]
    }
}
