//
//  Category.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Category: Codable {
    
    var name: String?
    var sortOrder: Int?
    var image: String?
    var iconImage: String?
    var iconImageActive: String?
    var subcategories: [Subcategories]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case sortOrder = "sortOrder"
        case image = "image"
        case iconImage = "iconImage"
        case iconImageActive = "iconImageActive"
        case subcategories = "subcategories"
    }
    
}
