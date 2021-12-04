//
//  DrinkImageView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import SwiftUI
import SwiftUI

struct DrinkImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    @ViewBuilder
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:100, height:100)
            .clipShape(Circle())
            .onReceive(imageLoader.$image) { image in
                self.image = image
        }
        .onAppear {
            self.imageLoader.loadImage(for: self.urlString)
        }
    }
}
