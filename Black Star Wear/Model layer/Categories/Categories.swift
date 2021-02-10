//
//  Categories.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Categories: Codable {
    
    var categories: [Int: Category]
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
    }
    
}
