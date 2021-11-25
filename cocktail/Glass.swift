//
//  Message.swift
//  cocktail
//
//  Created by Gabor Havasi on 2021. 11. 25..
//  Copyright © 2021. Gabor Havasi. All rights reserved.
//

import Foundation

struct Glass:Identifiable, Codable {
    var id: UUID
    var name: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
