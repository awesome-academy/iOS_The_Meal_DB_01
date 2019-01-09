//
//  AMealViewController.swift
//  TheMealDB
//
//  Created by mac on 12/20/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

struct ConfigureCell {
    static let identifier = "IngredientsCell"
    static let height = Dimension.sharedInstance.heightIngredientsCell
    static let headerNibName = "HeaderAMealScreen"
    static let minimumLineSpacingForSection: CGFloat = 5
}

struct ConfigureHeaderCell {
    static let headerNibName = "HeaderAMealScreen"
}

final class AMealViewController: BaseViewController {
    //  MARK: - UI Element
    @IBOutlet weak private var aMealCollectionView: UICollectionView!
    
    //  MARK: - Properties
    var ingredients = [FoodResource]()
    var meal = Meal()
    {
        didSet {
            self.ingredients = meal.resources
        }
    }
    
    //  MARK: - Life Cycle    
    override func initialize() {
        super.initialize()
        initCollectionView()
        setUpNavigationBar()
    }
    
    //  MARK: - Setup Action
    private func initCollectionView() {
        aMealCollectionView.dataSource = self
        aMealCollectionView.delegate = self
        let nibName = UINib(nibName: ConfigureCell.identifier, bundle: nil)
        aMealCollectionView.register(nibName, forCellWithReuseIdentifier: ConfigureCell.identifier)
        let headerNibName = UINib(nibName: ConfigureCell.headerNibName, bundle: nil)
        aMealCollectionView.register(headerNibName, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ConfigureCell.headerNibName)
    }
    
    private func setUpNavigationBar() {
        let backBarButton = UIBarButtonItem(image: Resource.Images.backButton,
                                            style: .plain,
                                            target: self,
                                            action: #selector(backToPrevious))
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    @objc func backToPrevious() {
        dismiss(animated: true, completion: nil)
    }
}

extension AMealViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfigureCell.identifier, for: indexPath) as? IngredientsCell else {
            return UICollectionViewCell()
        }
        cell.configuage(data: ingredients[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return ConfigureCell.minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: ConfigureCell.headerNibName,
                                                                           for: indexPath) as? HeaderAMealScreen else {
            return UICollectionReusableView()
        }
        header.configure(data: meal)
        return header
    }
}

extension AMealViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: ConfigureCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
