//
//  Categories.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Categories: Decodable {
    
    var categories: [Category]
    
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
        var tempArray = [Category]()
        for key in container.allKeys {
            let decodedObject = try container.decode(Category.self,
                                                     forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }
        
        categories = tempArray
    }
    
}
