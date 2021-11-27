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
            List(networkManager.fetchedCategories){category in
                NavigationLink(destination: DrinkListView(title: category.name, glassId: nil, categoryId: category.id)){
                        Text(category.name)
                }
            }
        }
        .navigationBarTitle("Categories", displayMode: .inline)
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
