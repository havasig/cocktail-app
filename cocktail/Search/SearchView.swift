//
//  SearchView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var searchText: String = ""
    @State var showCancelButton = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    // Search view
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            TextField("search-by-name...", text: $searchText, onEditingChanged: { isEditing in
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
                        
                        if showCancelButton  {
                            Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                            }
                            .foregroundColor(Color(.systemBlue))
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    self.searchText = ""
                }
                
                if self.searchText != "" {
                    NavigationLink(destination: DrinkListView(title: "Find by name", isGlass: false, isCategory: false, ingredients: nil, name: self.searchText)) {
                        Text("search")
                    }
                    .padding(10)
                }
                
                NavigationLink(destination: GlassListView()) {
                    Text("glasses")
                }
                NavigationLink(destination: CategoryListView()) {
                    Text("categories")
                }
                NavigationLink(destination: IngredientListView()) {
                    Text("ingredients")
                }
                Spacer()
            }
            .navigationBarTitle("search")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

/*
 HStack(alignment: .top) {
 TextField("Search ...", text: $text)
 .padding(7)
 .padding(.horizontal, 25)
 .background(Color(.systemGray6))
 .cornerRadius(8)
 .overlay(
 HStack {
 Image(systemName: "magnifyingglass")
 .foregroundColor(.gray)
 .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
 .padding(.leading, 8)
 
 if isEditing {
 Button(action: {
 self.text = ""
 }) {
 Image(systemName: "multiply.circle.fill")
 .foregroundColor(.gray)
 .padding(.trailing, 8)
 }
 }
 }
 )
 .padding(.horizontal, 10)
 .onTapGesture {
 self.isEditing = true
 }
 
 if isEditing {
 Button(action: {
 self.isEditing = false
 self.text = ""
 
 }) {
 Text("Cancel")
 }
 .padding(.trailing, 10)
 .transition(.move(edge: .trailing))
 .animation(.default)
 }
 }
 */
