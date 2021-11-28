//
//  SearchView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 23..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("boii")
                NavigationLink(destination: GlassListView()) {
                    Text("glasses")
                }
                NavigationLink(destination: CategoryListView()) {
                    Text("categories")
                }
            }
            .navigationBarTitle("search")
        }
    }
}
/*
 
 HStack {
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
