//
//  FetchedDrinksByIngredientsDto.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 12. 28..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation


struct DrinksByIngredientsDto: Codable {
    var zero: [Drink] = []
    var one: [Drink] = []
    var two: [Drink] = []
    var three: [Drink] = []
    var more: [Drink] = []
    
    enum CodingKeys: String, CodingKey {
        case zero
        case one
        case two
        case three
        case more
    }
}
