//
//  Products.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

struct Products: Decodable {
    
    var products: [Product]
    
    private struct DynamicCodingKeys: CodingKey {
        
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempArray = [Product]()
        for key in container.allKeys {
            if let dynamicCodingKey = DynamicCodingKeys(stringValue: key.stringValue) {
                
                let decodedObject = try container.decode(Product.self, forKey: dynamicCodingKey)
                tempArray.append(decodedObject)
            }
        }
        
        products = tempArray
    }
    
}
