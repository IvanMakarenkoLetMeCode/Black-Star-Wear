//
//  CartCellData.swift
//  Black Star Wear
//
//  Created by Ivan on 26.02.2021.
//

import Foundation

protocol CartCellData {
    
    var id: String { get }
    var name: String { get }
    var description: String { get }
    var colorName: String { get }
    var mainImage: String { get }
    var productImages: [ProductImages] { get }
    var offers: [Offers] { get }
    var price: Double { get }
}

struct CartCellDataProducer: CartCellData {
    
    var id: String
    var name: String
    var description: String
    var colorName: String
    var mainImage: String
    var productImages: [ProductImages]
    var offers: [Offers]
    var price: Double
}
