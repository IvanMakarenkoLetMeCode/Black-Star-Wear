//
//  Subcategories.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Subcategories: Codable {
    
    var id: Int?
    var iconImage: String?
    var sortOrder: Int?
    var name: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case iconImage = "iconImage"
        case sortOrder = "sortOrder"
        case name = "name"
        case type = "type"
    }
    
}
