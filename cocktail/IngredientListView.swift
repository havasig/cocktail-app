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
    @State private var searchText = ""
    @State var showCancelButton = false
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return networkManager.fetchedIngredients
        } else {
            return networkManager.fetchedIngredients.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    // Search view
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            TextField("ingredient...", text: $searchText, onEditingChanged: { isEditing in
                                self.showCancelButton = true
                            }).foregroundColor(.primary)
                            
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                            }
                            
                        }
                        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                        .foregroundColor(.secondary)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10.0)
                        
                        if self.selectedIngredients.count > 0  {
                            Button(action: {}, label: {
                                NavigationLink(destination: DrinkListIngredientView(ingredients: self.selectedIngredients)) {
                                    Text("search")
                                }
                            })
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                    .padding(10)
                }
                .onAppear {
                    self.searchText = ""
                }
                
                
                VStack {
                    List {
                        ForEach(searchResults, id: \.self) { ingredient in
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
            }
            .navigationBarTitle("ingredients", displayMode: .inline)
        }
    }
}
