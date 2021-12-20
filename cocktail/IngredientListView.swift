//
//  IngredientListView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 12. 09..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct IngredientListView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedIngredients: [String] = []
    
    var body: some View {
        VStack {
             List {
             ForEach(networkManager.fetchedIngredients, id: \.self) { ingredient in
                 Button(action: {
                     if !self.selectedIngredients.contains(ingredient) {
                         self.selectedIngredients.append(ingredient)
                     } else {
                         if let index = self.selectedIngredients.firstIndex(of: ingredient) {
                             self.selectedIngredients.remove(at: index)
                         }
                     }
                 }, label: {
                     Text(ingredient)
                         .foregroundColor(self.selectedIngredients.contains(ingredient) ? .blue : .black)
                 })
             }
             }
             
            
        }
        .onAppear {
            self.networkManager.fetchIngredients()
        }
        .navigationBarTitle("ingredients", displayMode: .inline)
            /*
             .navigationBarItems(trailing:
                 Button(action: {}, label: {
                     if self.selectedIngredients.count > 0 {
                         NavigationLink(destination: DrinkListView(title: "ingredients", isGlass: false, isCategory: false, ingredients: self.selectedIngredients)) {
                             Text("search")
                         }
                     } else {}
                 })
             )
             */
        
    }
}
//NavigationLink(destination: DrinkListView(title: "ingredients", isGlass: true, isCategory: false, ingredients: self.selectedIngredients),
//isActive: $search) {
