//
//  Offers.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

struct Offers: Decodable {
    
    var size: String?
    var productOfferID: String?
    var quantity: String?
    
    enum CodingKeys: String, CodingKey {
        
        case size = "size"
        case productOfferID = "productOfferID"
        case quantity = "quantity"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        size = try? container.decode(String.self, forKey: .size)
        productOfferID = try? container.decode(String.self, forKey: .productOfferID)
        quantity = try? container.decode(String.self, forKey: .quantity)
    }
    
}
