//
//  RandomView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct RandomView: View {
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    var thumb: UIImage? = nil
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {                
                NavigationLink(destination: DrinkDetailsView(drink: self.networkManager.fetchedDrink)){
                        Text(self.networkManager.fetchedDrink.name)
                    }

                VStack(alignment: .leading) {
                    ForEach(self.networkManager.fetchedDrink.ingredients.indices, id: \.self) { id -> Text in
                            var measure = ""
                        if id < self.networkManager.fetchedDrink.measures.count {
                                measure = self.networkManager.fetchedDrink.measures[id]
                            }
                            return Text("\(measure) \(self.networkManager.fetchedDrink.ingredients[id])")
                        }
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    self.networkManager.fetchRandomDrink()
                }) {
                    Text("try_other")
                }
            }
            .onAppear {
                self.networkManager.fetchRandomDrink()
            }
            .navigationBarTitle("random")
        }        
    }
}
