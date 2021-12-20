//
//  DrinkDetailsView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI
import CoreData

struct DrinkDetailsView: View {
    var drink: Drink
    @State var favourite: Bool = false
    @ObservedObject var networkManager = NetworkManager()
    let preferredLanguage = Bundle.preferredLocalizations(from: ["", "IT"]).first!
    @State var localizedInstructions = ""
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    var thumb: UIImage? = nil
    
    
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
                HStack {
                    //Text(drink.name)
                    //    .font(.title)
                    //.fixedSize(horizontal: false, vertical: true)
                    //.frame(alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text("ingredients")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        ForEach(self.drink.ingredients.indices, id: \.self) { id -> Text in
                            var measure = ""
                            if id < self.drink.measures.count {
                                measure = self.drink.measures[id]
                            }
                            
                            return Text("\(measure) \(self.drink.ingredients[id])")
                            //.fixedSize(horizontal: false, vertical: false)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    if thumb != nil {
                        Image(uiImage: thumb!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100, height:100)
                            .clipShape(Circle())
                            .padding(20)
                    } else {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100, height:100)
                            .clipShape(Circle())
                            .padding(20)
                            .onReceive(imageLoader.$image) { image in
                                self.image = image
                        }
                    }
                }
                
                Divider()
                
                Group {
                    Text("glass")
                        .font(.title)
                        .bold()
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(drink.glass)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("instructions")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(localizedInstructions)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(20)
            .onAppear {
                self.favourite = self.networkManager.isDrinkFavourite(drinkName: self.drink.name)
                self.setInstruction()
                if self.thumb == nil {
                    self.imageLoader.loadImage(for: self.drink.thumb)
                }
            }
            .navigationBarTitle(Text(drink.name))
            .navigationBarItems(trailing:
                Button(action: {
                    self.favourite = !self.favourite
                    self.networkManager.isDrinkFavouritePressed(drink: self.drink, image: self.image)
                }) {
                    if self.favourite {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
            )
        }
        
    }
}
