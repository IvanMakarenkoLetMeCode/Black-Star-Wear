//
//  ProductImages.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import RealmSwift

struct ProductImages: Decodable {
    
    var imageURL: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case imageURL = "imageURL"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageURL = "https://blackstarshop.ru/" + (try container.decode(String.self, forKey: .imageURL))
    }
    
    init(from dbObject: ProductImagesDBObject) throws {
        
        imageURL = dbObject.imageURL
    }
    
}

class ProductImagesDBObject: Object {
    
    @objc dynamic var imageURL: String = ""
    
    convenience init(model: ProductImages) {

        self.init()
        imageURL = model.imageURL
    }
    
}
