//
//  GlassListView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 25..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct GlassListView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        VStack {
            List(networkManager.fetchedGlasses){glass in
                Text(glass.name)
            }
        }.onAppear {
            self.networkManager.fetchGlasses()
        }
    }
}

struct GlassListView_Previews: PreviewProvider {
    static var previews: some View {
        GlassListView()
    }
}
