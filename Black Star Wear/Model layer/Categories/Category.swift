//
//  Category.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Category: Decodable {
    
    var id: String
    var name: String
    var sortOrder: String?
    var image: String
    var iconImage: String
    var iconImageActive: String
    var subcategories: [Subcategory]?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case sortOrder = "sortOrder"
        case image = "image"
        case iconImage = "iconImage"
        case iconImageActive = "iconImageActive"
        case subcategories = "subcategories"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = container.codingPath.first!.stringValue
        name = try container.decode(String.self, forKey: .name)
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
        image = try container.decode(String.self, forKey: .image)
        iconImage = try container.decode(String.self, forKey: .iconImage)
        iconImageActive = try container.decode(String.self, forKey: .iconImageActive)
        subcategories = try? container.decode([Subcategory].self, forKey: .subcategories)
    }
    
}
