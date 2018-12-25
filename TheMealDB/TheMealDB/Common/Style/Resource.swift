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
        public static var alertImage = UIImage(named: "AlertButton") ?? UIImage(named: "noImage")
        public static var searchImage = UIImage(named: "SearchButton") ?? UIImage(named: "noImage")
        public static var backButton = UIImage(named: "BackButton") ?? UIImage(named: "noImage")
        public static var homeGrey = UIImage(named: "homegrey") ?? UIImage(named: "noImage")
        public static var homeOrange = UIImage(named: "homeorange") ?? UIImage(named: "noImage")
        public static var kindGrey = UIImage(named: "kindgrey") ?? UIImage(named: "noImage")
        public static var kindOrange = UIImage(named: "kindorange") ?? UIImage(named: "noImage")
        public static var chocolate = UIImage(named: "chocolate") ?? UIImage(named: "noImage")
        public static var soup = UIImage(named: "soup") ?? UIImage(named: "noImage")
        public static var arrCategories = [chocolate, soup] 
        public static var meatTacos = UIImage(named: "meatTacos") ?? UIImage(named: "noImage")
        public static var areaImage = UIImage(named: "areaImage") ?? UIImage(named: "noImage")
        public static var idMealImage = UIImage(named: "idMealImage") ?? UIImage(named: "noImage")
        public static var heartGray = UIImage(named: "heart1") ?? UIImage(named: "noImage")
        public static var heartOrigin = UIImage(named: "heart2") ?? UIImage(named: "noImage")
        public static var favoriteWhite = UIImage(named: "favoriteWhite") ?? UIImage(named: "noImage")
        public static var favoriteRed = UIImage(named: "favoriteRed") ?? UIImage(named: "noImage")
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
    public static var categoryTitle = "CATEGORY"
    public static var mealTitle = "MEAL"
}

