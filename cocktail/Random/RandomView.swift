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
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DrinkDetailsView(drink: self.networkManager.fetchedDrink)){
                        Text(self.networkManager.fetchedDrink.name)
                    .padding(30)
                    }
                
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
