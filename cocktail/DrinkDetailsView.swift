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
    let preferredLanguage = Bundle.preferredLocalizations(from: ["", "IT"]).first!
    @State var localizedInstructions = ""
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    func setInstruction() {
        switch(preferredLanguage) {
        case "IT": localizedInstructions = drink.instructionsIT ?? drink.instructions
        default: localizedInstructions = drink.instructions
        }
    }
    
    @ViewBuilder
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:100, height:100)
                    .clipShape(Circle())
                    .padding(20)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                }
                
                Text(drink.name)
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                
                Group {
                HStack {
                    VStack(alignment: .trailing) {
                        ForEach(drink.ingredients, id: \.self){ingredient in
                            Text(ingredient)
                        }
                    }
                    .padding(10)
                    VStack(alignment: .leading) {
                        ForEach(drink.measures, id: \.self){measure in
                            Text(measure)
                        }
                    }
                    .padding(10)
                }
                
                    Text("glass:" + drink.glass)
                    Text("instructions:")
                    Text(localizedInstructions)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .onAppear {
                self.networkManager.isDrinkFavourite(drinkId: self.drink.id)
                self.setInstruction()
                self.imageLoader.loadImage(for: self.drink.thumb)
            }
            .navigationBarTitle(Text(drink.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    //self.networkManager.isDrinkFavouritePressed(drinkId: self.networkManager.fetchedDrink.id)
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
