//
//  CustomImageView.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation
import SwiftUI

struct ThumbImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    @ViewBuilder
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:50, height:50)
        .clipShape(Circle())
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                self.imageLoader.loadImage(for: self.urlString)
            }
    }
}
