//
//  Subcategory.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Subcategory: Decodable {
    
    var id: String?
    var iconImage: String
    var sortOrder: String?
    var name: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case iconImage = "iconImage"
        case sortOrder = "sortOrder"
        case name = "name"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        iconImage = try container.decode(String.self, forKey: .iconImage)
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
    }
    
}
