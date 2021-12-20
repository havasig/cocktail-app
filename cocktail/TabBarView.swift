//
//  ContentView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            RandomView()
                .tabItem {
                    Text("random")
                    Image(systemName: "ant.fill")
            }.tag(0)
            FavouriteView()
                .tabItem {
                    Text("favourite")
                    Image(systemName: "heart.fill")
            }.tag(1)
            SearchView()
                .tabItem {
                    Text("search")
                    Image(systemName: "magnifyingglass")
            }.tag(2)
            Top10View()
                .tabItem {
                    Text("top10")
                    Image(systemName: "10.square")
            }.tag(3)
            SettingsView()
                .tabItem {
                    Text("settings")
                    Image(systemName: "flame.fill")
            }.tag(4)
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
