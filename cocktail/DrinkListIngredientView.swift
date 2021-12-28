//
//  DrinkListIngredientView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 12. 28..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct DrinkListIngredientView: View {
    let ingredients: [String]?
    @ObservedObject var networkManager = NetworkManager()
    
    @ViewBuilder
    var body: some View {
        VStack {
            Form {
                
                if networkManager.fetchedDrinksByIngredients.zero.count > 0 {
                    Section(header: Text("zero ingredient missing")) {
                        List(networkManager.fetchedDrinksByIngredients.zero){drink in
                            NavigationLink(destination: DrinkDetailsView(drink: drink)){
                                ThumbImageView(urlString: drink.thumb)
                                Text(drink.name)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }
                
                
                if networkManager.fetchedDrinksByIngredients.one.count > 0 {
                    Section(header: Text("one ingredient missing")) {
                        List(networkManager.fetchedDrinksByIngredients.one){drink in
                            NavigationLink(destination: DrinkDetailsView(drink: drink)){
                                ThumbImageView(urlString: drink.thumb)
                                Text(drink.name)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }
                
                
                if networkManager.fetchedDrinksByIngredients.two.count > 0 {
                    Section(header: Text("two ingredient missing")) {
                        List(networkManager.fetchedDrinksByIngredients.two){drink in
                            NavigationLink(destination: DrinkDetailsView(drink: drink)){
                                ThumbImageView(urlString: drink.thumb)
                                Text(drink.name)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }
                
                
                if networkManager.fetchedDrinksByIngredients.three.count > 0 {
                    Section(header: Text("three ingredient missing")) {
                        List(networkManager.fetchedDrinksByIngredients.three){drink in
                            NavigationLink(destination: DrinkDetailsView(drink: drink)){
                                ThumbImageView(urlString: drink.thumb)
                                Text(drink.name)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }
                
                
                if networkManager.fetchedDrinksByIngredients.more.count > 0 {
                    Section(header: Text("more ingredient missing")) {
                        List(networkManager.fetchedDrinksByIngredients.more){drink in
                            NavigationLink(destination: DrinkDetailsView(drink: drink)){
                                ThumbImageView(urlString: drink.thumb)
                                Text(drink.name)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }
            }
        }
        .navigationBarTitle(Text("ingredients"), displayMode: .inline)
        .onAppear {
            self.networkManager.fetchDrinksByIngredients(ingredients: self.ingredients!)
        }
    }
}
