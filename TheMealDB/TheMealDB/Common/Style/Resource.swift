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
        public static var alertButton: UIImage? = UIImage(named: "AlertButton")
        public static var searchButton: UIImage? = UIImage(named: "SearchButton")
        public static var backButton: UIImage? = UIImage(named: "BackButton")
        public static var homeGray: UIImage? = UIImage(named: "home1")
        public static var homeOrigin: UIImage? = UIImage(named: "home2")
        public static var kindGray: UIImage? = UIImage(named: "kind1")
        public static var kindOrigin: UIImage? = UIImage(named: "kind2")
        public static var chocolate: UIImage? = UIImage(named: "chocolate")
        public static var soup: UIImage? = UIImage(named: "soup")
        public static var arrCategories = [chocolate, soup]
        public static var meatTacos: UIImage? = UIImage(named: "meatTacos")
        public static var areaImage: UIImage? = UIImage(named: "areaImage")
        public static var idMealImage: UIImage? = UIImage(named: "idMealImage")
        public static var heartGray: UIImage? = UIImage(named: "heart1")
        public static var heartOrigin: UIImage? = UIImage(named: "heart2")
    }
    
    public struct Navigation {
        public static var homeTitle = "HOME"
        public static var favoritesTitle = "FAVORITES"
        public static var categoriesTitle = "CATEGORIES"
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
