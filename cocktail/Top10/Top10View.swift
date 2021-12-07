//
//  Top10View.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI
import CoreData

struct Top10View: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                List(networkManager.fetchedDrinks){drink in
                    NavigationLink(destination: DrinkDetailsView(drink: drink)){
                        ThumbImageView(urlString: drink.thumb)
                        Text(drink.name)
                    }
                }
            }
            .onAppear {
                self.networkManager.fetchTop10Drink()
            }
            .navigationBarTitle("top10")
        }
    }
}

struct Top10View_Previews: PreviewProvider {
    static var previews: some View {
        Top10View()
    }
}
