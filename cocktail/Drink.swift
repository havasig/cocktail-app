//
//  Drink.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation

struct Drink:Identifiable, Codable {
    var id: Int
    var name: String
    var thumb: String
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case thumb = "strDrinkThumb"
    }
}
