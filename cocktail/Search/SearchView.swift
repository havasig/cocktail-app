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
                        
                        if showCancelButton && searchText != ""  {
                            NavigationLink(destination: DrinkListView(title: "Find by name", isGlass: false, isCategory: false, name: String(self.searchText.lowercased().unicodeScalars.filter {CharacterSet.alphanumerics.contains($0)}))) {
                                Text("search")
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    self.searchText = ""
                }
                
                NavigationLink(destination: GlassListView()) {
                    Text("glasses")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Divider()
                
                NavigationLink(destination: CategoryListView()) {
                    Text("categories")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Divider()                
                
                Image("cocktail-glass")
                .resizable()
                .scaledToFit()
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
