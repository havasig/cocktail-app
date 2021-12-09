//
//  SettingsView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("settings")
            }
            .navigationBarTitle("settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
