//
//  DrinkListView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct DrinkListView: View {
    let glassId: Int 
    let categoryId: Int
    
    var body: some View {
        VStack {
            Text("Glass id tapped: \(glassId)")
            
            Text("Category id tapped: \(categoryId)")
        }
    }
}
