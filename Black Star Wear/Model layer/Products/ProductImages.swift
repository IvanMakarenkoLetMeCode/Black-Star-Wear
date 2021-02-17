//
//  ProductImages.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

struct ProductImages: Decodable {
    
    var imageURL: String?
    var sortOrder: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case imageURL = "imageURL"
        case sortOrder = "sortOrder"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageURL = try? container.decode(String.self, forKey: .imageURL)
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
    }
    
}
