//
//  DrinkListView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct DrinkListView: View {
    let title: String
    let isGlass: Bool
    let isCategory: Bool
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            List(networkManager.fetchedDrinks){drink in
                NavigationLink(destination: DrinkDetailsView(drink: drink)){
                    ThumbImageView(urlString: drink.thumb)
                    Text(drink.name)
                }
            }
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
        .onAppear {
            if self.isGlass {
                self.networkManager.fetchDrinksByGlassName(glassName: self.title)
            } else if self.isCategory {
                self.networkManager.fetchDrinksByCategoryName(categoryName: self.title)
            }
        }
    }
}
