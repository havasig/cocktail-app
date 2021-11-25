//
//  ContentView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            RandomView()
                .tabItem {
                    Text("Random")
                    Image(systemName: "ant.fill")
            }
            FavouriteView()
                .tabItem {
                    Text("Favourite")
                    Image(systemName: "heart.fill")
            }
            SearchView(text: .constant(""))
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
            }
            Top10View()
                .tabItem {
                    Text("Top10")
                    Image(systemName: "10.square")
            }
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "flame.fill")
            }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
