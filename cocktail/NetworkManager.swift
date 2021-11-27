//
//  NetworkManager.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 25..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import UIKit

class NetworkManager: ObservableObject {
    @Published var fetchedGlasses = [Glass]()
    @Published var fetchedCategories = [Category]()
    @Published var fetchedDrinks = [Drink]()
        
    func fetchGlasses() {
        let urlString =
        "http://10.0.2.2:8080/api/all-glasses"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let glasses = try decoder.decode(Array<Glass>.self, from: data)
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
        let urlString =
        "http://10.0.2.2:8080/api/all-categories"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let categories = try decoder.decode(Array<Category>.self, from: data)
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
        
    func fetchDrinksByGlass(glassId: Int) {
        let urlString =
        "http://10.0.2.2:8080/api/drinks/glass/1" //\(glassId)"
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
        
    func fetchDrinksByCategory(categoryId: Int) {
        let urlString =
        "http://10.0.2.2:8080/api/drinks/category/1" //\(categoryId)"
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
}
