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
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("ingredients")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                    ForEach(self.networkManager.fetchedDrink.ingredients.indices, id: \.self) { id -> Text in
                        var measure = ""
                        if id < self.networkManager.fetchedDrink.measures.count {
                            measure = self.networkManager.fetchedDrink.measures[id]
                        }
                        
                        return Text("\(measure) \(self.networkManager.fetchedDrink.ingredients[id])")
                    }
                }
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                NavigationLink(destination: DrinkDetailsView(drink: self.networkManager.fetchedDrink)){
                        Text("details")
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Spacer()
                
                Button(action: {
                    self.networkManager.fetchRandomDrink()
                }) {
                    Text("try_other")
                }
                .buttonStyle(GrowingButton())
            }
            .padding(20)
            .onAppear {
                self.networkManager.fetchRandomDrink()
            }
            .navigationBarTitle(Text(self.networkManager.fetchedDrink.name))
        }        
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
