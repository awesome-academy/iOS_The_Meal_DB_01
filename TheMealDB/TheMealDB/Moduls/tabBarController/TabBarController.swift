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
    private let baseVC = BaseViewController()
    
    //  MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    //  MARK: - Setup Action
    func setUpTabBar() {
        homeVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.homeGray, selectedImage: Resource.Images.homeOrigin)
        baseVC.tabBarItem = UITabBarItem(title: nil, image: Resource.Images.kindGray, selectedImage: Resource.Images.kindOrigin)
        viewControllers = [homeVC, baseVC]
    }
}

