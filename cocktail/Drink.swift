//
//  Drink.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation

struct Drink:Identifiable, Codable {
    var id: Int = 0
    var name: String = ""
    var thumb: String = ""
    var ingredients: [String] = []
    var measures: [String] = []
    var glass: String = ""
    var instructions: String = ""
    var instructionsIT: String? = ""
    enum CodingKeys: String, CodingKey {
        case id = "dbId"
        case name
        case thumb = "thumbUrl"
        case ingredients
        case measures
        case glass
        case instructions
        case instructionsIT
    }
}
