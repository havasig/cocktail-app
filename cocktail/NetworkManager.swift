//
//  NetworkManager.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 25..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import UIKit
import CoreData

class NetworkManager: ObservableObject {
    
    @Published var fetchedGlasses = [String]()
    @Published var fetchedCategories = [String]()
    @Published var fetchedDrinks = [Drink]()
    @Published var fetchedDrink = Drink()
    @Published var fetchedDrinkIsFavourite: Bool = false
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func fetchGlasses() {
        let urlString = "https://cocktail-app-db.herokuapp.com/glass"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let glasses = try decoder.decode(Array<String>.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedGlasses = glasses
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
        
    func fetchCategories() {
        let urlString = "https://cocktail-app-db.herokuapp.com/category"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let categories = try decoder.decode(Array<String>.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedCategories = categories
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
        
    func fetchDrinksByGlassName(glassName: String) {
        let urlString = "https://cocktail-app-db.herokuapp.com/filter/glass/\(glassName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let drinks = try decoder.decode(Array<Drink>.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedDrinks = drinks
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
        
        func fetchDrinksByCategoryName(categoryName: String) {
            let urlString =
            "https://cocktail-app-db.herokuapp.com/filter/category/\(categoryName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            if let url = URL(string: urlString){
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error)
                    in
                    if error == nil{
                        let decoder = JSONDecoder()
                        if let data = data{
                            do{
                                let drinks = try decoder.decode(Array<Drink>.self, from: data)
                                DispatchQueue.main.async {
                                    self.fetchedDrinks = drinks
                                }
                            } catch{
                                print(error)
                            }
                        }
                    }
                }
                task.resume()
            }
        }
    
    func fetchDrinkById(drinkId: Int) {
        let urlString = "https://cocktail-app-db.herokuapp.com/drink/\(drinkId)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let drink = try decoder.decode(Drink.self, from: data)
                            DispatchQueue.main.async {
                                //self.fetchedDrink = drink
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func fetchRandomDrink() {
        let urlString = "https://cocktail-app-db.herokuapp.com/random"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let drink = try decoder.decode(Drink.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedDrink = drink
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchTop10Drink() {
        let urlString = "https://cocktail-app-db.herokuapp.com/top10"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let drinks = try decoder.decode(Array<Drink>.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedDrinks = drinks
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func isDrinkFavourite(drinkId: Int) {
        //fetch from db
    }
    
    func isDrinkFavouritePressed(drink: Drink) {
        //save in db
        self.fetchedDrinkIsFavourite = !self.fetchedDrinkIsFavourite
        
        let dbDrink2 = DrinkEntity(context: context)
        dbDrink2.id = Int32(drink.id)
        dbDrink2.name = drink.name
        dbDrink2.thumb = drink.thumb
        dbDrink2.glass = drink.glass
        dbDrink2.instructions = drink.instructions
        dbDrink2.instructionsIT = drink.instructionsIT
        
        //let dbDrink = NSEntityDescription.insertNewObject(forEntityName: "DrinkEntity", into: context)
        //dbDrink.setValue(drink.id, forKey: "id")
        //dbDrink.setValue(drink.name, forKey: "name")
        //dbDrink.setValue(drink.thumb, forKey: "thumb")
        //dbDrink.setValue(drink.glass, forKey: "glass")
        //dbDrink.setValue(drink.instructions, forKey: "instructions")
        //dbDrink.setValue(drink.instructionsIT, forKey: "instructionsIT")
        //dbDrink.setValue(drink.ingredients, forKey: "ingredients")
        //dbDrink.setValue(drink.measures, forKey: "measures")
                
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getFavourites() {

        
    }
}
