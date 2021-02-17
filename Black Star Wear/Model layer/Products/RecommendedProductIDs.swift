//
//  RecommendedProductIDs.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

struct RecommendedProductIDs: Decodable {
    
    var recommendedProductIDs: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case recommendedProductIDs = ""
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recommendedProductIDs = try? container.decode([String].self, forKey: .recommendedProductIDs)
    }
    
}
