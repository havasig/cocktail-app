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
    let glassId: Int?
    let categoryId: Int?
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
                self.networkManager.fetchDrinksByGlass(glassId: self.glassId!)
             }
     }    
}
