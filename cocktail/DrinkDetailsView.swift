//
//  DrinkDetailsView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct DrinkDetailsView: View {
    var drink: Drink
    @ObservedObject var networkManager = NetworkManager()
    
    @ViewBuilder
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                DrinkImageView(urlString: drink.thumb)
                .padding(20)
                Text(drink.name)
                    .font(.largeTitle)
                
            }
            .onAppear {
                self.networkManager.isDrinkFavourite(drinkId: self.drink.id)
            }
            .navigationBarTitle(Text(drink.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.networkManager.isDrinkFavouritePressed(drinkId: self.drink.id)
                }) {
                    if self.networkManager.fetchedDrinkIsFavourite {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
            )
        }
        
    }
}
