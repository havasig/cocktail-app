//
//  CategoryListView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        VStack {
            List(networkManager.fetchedCategories, id: \.self){category in
                NavigationLink(destination: DrinkListView(title: category, isGlass: false, isCategory: true, ingredients: nil, name: nil)){
                        Text(category)
                }
            }
        }
        .navigationBarTitle("categories", displayMode: .inline)
        .onAppear {
            self.networkManager.fetchCategories()
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
