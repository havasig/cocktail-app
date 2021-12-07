//
//  FavouriteView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI
import CoreData

struct FavouriteView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    @FetchRequest(
    entity: DrinkEntity.entity(),
    sortDescriptors: [
    NSSortDescriptor(keyPath: \DrinkEntity.name, ascending: true)]
    ) var drinks: FetchedResults<DrinkEntity>
        
    
    var body: some View {
        NavigationView {
            VStack {
                List(drinks, id: \.self){drinkEntity in
                    NavigationLink(destination: Text("ss")){//DrinkDetailsView(drink: self.DrinkEntityToDrink(drinkEntity: drinkEntity))
                            //ThumbImageView(urlString: drinkEntity.thumb)
                        Text("drinkEntity.name")
                    }
                }
            }
            .navigationBarTitle("favourites")
        }
    }
    
    func DrinkEntityToDrink(drinkEntity: DrinkEntity) -> Drink {
        var newDrink = Drink()
            newDrink.id = Int(drinkEntity.id)
        
        if let name = drinkEntity.name {
            newDrink.name = name
        }
        if let thumb = drinkEntity.thumb {
            newDrink.thumb = thumb
        }
        if let glass = drinkEntity.glass {
            newDrink.glass = glass
        }
        if let instructions = drinkEntity.instructions {
            newDrink.instructions = instructions
        }
        if let instructionsIT = drinkEntity.instructionsIT {
            newDrink.instructionsIT = instructionsIT
        }
        
        return newDrink
    }
}
