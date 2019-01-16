//
//  ViewController.swift
//  CoreDataApp1
//
//  Created by mac on 10/31/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import CoreData
import ObjectMapper

final class DBManager {
    //  MARK: - ManagedObjectContext
    private func getManagedObjectContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    private var context: NSManagedObjectContext? {
        get {
            return getManagedObjectContext()
        }
    }
    
    //  MARK: - Core Data
    private func addMeal(MealObject: NSManagedObject, idMeal: String, strMeal: String, strArea: String, strCategory: String, strMealThumb: String) {
        MealObject.setValue(idMeal, forKey: "idMeal")
        MealObject.setValue(strMeal, forKey: "strMeal")
        MealObject.setValue(strArea, forKey: "strArea")
        MealObject.setValue(strCategory, forKey: "strCategory")
        MealObject.setValue(strMealThumb, forKey: "strMealThumb")
    }
    
    func save(meal: Meal) {
        guard let context = context,
            let mealEntity = NSEntityDescription.entity(forEntityName: "MealObject", in: context) else { return }
        let MealManagedObject = NSManagedObject.init(entity: mealEntity, insertInto: context)
        addMeal(MealObject: MealManagedObject,
                idMeal: meal?.idMeal ?? "",
                strMeal: meal?.strMeal ?? "",
                strArea: meal?.strArea ?? "",
                strCategory: meal?.strCategory ?? "",
                strMealThumb: meal?.strMealThumb ?? "")
        do {
            try context.save()
        } catch {
            print("Error Save")
        }
    }
    
    func deleteDataAction(itemToDelete: NSManagedObject) {
        guard context?.delete(itemToDelete) else {
            return
        }
        do {
            try context.save()
        } catch {
            print("error delete")
        }
    }
    
    func fetchManagedData() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MealObject")
        do {
            guard let result = try context?.fetch(fetchRequest) as? [NSManagedObject] else {
                return [NSManagedObject]()
            }
            return result
        }
        catch {
            print("Error result")
        }
        return [NSManagedObject]()
    }
    
    func getMeals() -> [Meal] {
        let resultFetchData = fetchManagedData()
        var mealArray = [Meal]()
        for item in resultFetchData {
            let idMeal = item.value(forKey: "idMeal") as? String ?? ""
            let strMeal = item.value(forKey: "strMeal") as? String ?? ""
            let strArea = item.value(forKey: "strArea") as? String ?? ""
            let strCategory = item.value(forKey: "strCategory") as? String ?? ""
            let strMealThumb = item.value(forKey: "strMealThumb") as? String ?? ""
            let meal = Meal(idMeal: idMeal, strMeal: strMeal, strArea: strArea, strCategory: strCategory, strMealThumb: strMealThumb)
            mealArray.append(meal)
        }
        return mealArray
    }
}
