//
//  CategoryCellData.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import Foundation

protocol CategoryCellData {
    
    var id: String { get }
    var name: String { get }
    var sortOrder: String { get }
    var image: String { get }
    var iconImage: String { get }
    var iconImageActive: String { get }
    var subcategories: [Subcategory] { get }
}

struct CategoryCellDataProducer: CategoryCellData {
    
    var id: String
    var name: String
    var sortOrder: String
    var image: String
    var iconImage: String
    var iconImageActive: String
    var subcategories: [Subcategory]
}
