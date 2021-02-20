//
//  ProductsCellData.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import Foundation

protocol ProductsCellData {
    
    var name: String { get }
    var englishName: String { get }
    var sortOrder: String { get }
    var article: String { get }
    var collection: String { get }
    var description: String { get }
    var colorName: String { get }
    var colorImageURL: String { get }
    var mainImage: String { get }
    var productImages: [ProductImages] { get }
    var offers: [Offers] { get }
    var recommendedProductIDs: [RecommendedProductIDs] { get }
    var price: Double { get }
    var attributes: [Attributes] { get }
}

struct ProductsCellDataProducer: ProductsCellData {
    
    var name: String
    var englishName: String
    var sortOrder: String
    var article: String
    var collection: String
    var description: String
    var colorName: String
    var colorImageURL: String
    var mainImage: String
    var productImages: [ProductImages]
    var offers: [Offers]
    var recommendedProductIDs: [RecommendedProductIDs]
    var price: Double
    var attributes: [Attributes]
}
