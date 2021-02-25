//
//  Offers.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import RealmSwift

struct Offers: Decodable {
    
    var size: String
    
    enum CodingKeys: String, CodingKey {
        
        case size = "size"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        size = try container.decode(String.self, forKey: .size)
    }
    
    init(from dbObject: OffersDBObject) throws {
        
        size = dbObject.size
    }
    
}

class OffersDBObject: Object {
    
    @objc dynamic var size: String = ""
    
    convenience init(model: Offers) {
        
        self.init()
        size = model.size
    }
    
}
