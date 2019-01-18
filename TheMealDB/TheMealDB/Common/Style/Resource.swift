//
//  Resource.swift
//  HealthCareViewer
//
//  Created by MACOS on 10/19/18.
//  Copyright © 2018 MACOS. All rights reserved.
//

import UIKit

public class Resource {
    class var sharedInstance : Resource {
        struct Static {
            static let instance : Resource = Resource()
        }
        return Static.instance
    }
    
    public struct Images {
        public static var alertButton: UIImage? = UIImage(named: "alertButton")
        public static var searchButton: UIImage? = UIImage(named: "SearchButton")
        public static var backButton: UIImage? = UIImage(named: "backButton")
        public static var homeGrey: UIImage? = UIImage(named: "homegrey")
        public static var homeOrange: UIImage? = UIImage(named: "homeorange")
        public static var kindGrey: UIImage? = UIImage(named: "kindgrey")
        public static var kindOrange: UIImage? = UIImage(named: "kindorange")
        public static var chocolate: UIImage? = UIImage(named: "chocolate")
        public static var soup: UIImage? = UIImage(named: "soup")
        public static var arrCategories = [chocolate, soup]
        public static var meatTacos: UIImage? = UIImage(named: "meatTacos")
        public static var areaImage: UIImage? = UIImage(named: "areaImage")
        public static var idMealImage: UIImage? = UIImage(named: "idMealImage")
        public static var favoriteblack: UIImage? = UIImage(named: "favoriteblack")
        public static var favoritewhite: UIImage? = UIImage(named: "favoritewhite")
        public static var heartGrey: UIImage? = UIImage(named: "heartGrey")
        public static var heartOrange: UIImage? = UIImage(named: "heartOrange")
        public static var noImage: UIImage? = UIImage(named: "noImage")
    }
    
    public struct Navigation {
        public static var homeTitle = "HOME"
        public static var favoritesTitle = "FAVORITES"
        public static var categoriesTitle = "CATEGORIES"
        public static var inforAMeal = "Infor Of A Meal"
    }
}

extension UIFont {
    public class func helveticaNeue(fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Helvetica Neue", size: fontSize)
    }
}

struct ConstantLabel {
    public static var featuredRecipesTitle = "FEATURED RECIPES"
    public static var lastestTitle = "LASTEST"
}

