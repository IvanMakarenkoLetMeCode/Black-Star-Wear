//
//  Product.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

struct Product: Decodable {
    
    var name: String?
    var englishName: String?
    var sortOrder: String?
    var article: String?
    var collection: String?
    var description: String?
    var colorName: String?
    var colorImageURL: String?
    var mainImage: String?
    var productImages: [ProductImages]
    var offers: [Offers]
    var recommendedProductIDs: [RecommendedProductIDs]
    var instagramPhotos: [InstagramPhotos]
    var price: String?
    var attributes: [Attributes]
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case englishName = "englishName"
        case sortOrder = "sortOrder"
        case article = "article"
        case collection = "collection"
        case description = "description"
        case colorName = "colorName"
        case colorImageURL = "colorImageURL"
        case mainImage = "mainImage"
        case productImages = "productImages"
        case offers = "offers"
        case recommendedProductIDs = "recommendedProductIDs"
        case instagramPhotos = "instagramPhotos"
        case price = "price"
        case attributes = "attributes"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        englishName = try? container.decode(String.self, forKey: .englishName)
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
        article = try? container.decode(String.self, forKey: .article)
        collection = try? container.decode(String.self, forKey: .collection)
        description = try? container.decode(String.self, forKey: .description)
        colorName = try? container.decode(String.self, forKey: .colorName)
        colorImageURL = try? container.decode(String.self, forKey: .colorImageURL)
        mainImage = try? container.decode(String.self, forKey: .mainImage)
        productImages = (try? container.decode([ProductImages].self, forKey: .productImages)) ?? []
        offers = (try? container.decode([Offers].self, forKey: .offers)) ?? []
        recommendedProductIDs = (try? container.decode([RecommendedProductIDs].self,
                                                       forKey: .recommendedProductIDs)) ?? []
        instagramPhotos = (try? container.decode([InstagramPhotos].self, forKey: .instagramPhotos)) ?? []
        price = try? container.decode(String.self, forKey: .price)
        attributes = (try? container.decode([Attributes].self, forKey: .attributes)) ?? []
    }
    
}
