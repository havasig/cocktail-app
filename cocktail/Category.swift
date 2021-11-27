//
//  Category.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 27..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation

struct Category:Identifiable, Codable {
    var id: Int
    var name: String
    enum CodingKeys: String, CodingKey {
        case id
        case name = "strCategory"
    }
}
