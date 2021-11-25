//
//  NetworkManager.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 25..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import UIKit

class NetworkManager: ObservableObject {
    @Published var fetchedGlasses = [Glass]()
        
    func fetchGlasses() {
        let urlString =
        "MY_URL"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let data = data{
                        do{
                            let glasses = try
                            decoder.decode(Array<Glass>.self, from: data)
                            DispatchQueue.main.async {
                                self.fetchedGlasses = glasses
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
