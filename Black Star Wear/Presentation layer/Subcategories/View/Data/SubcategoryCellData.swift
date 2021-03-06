//
//  SubcategoryCellData.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

protocol SubcategoryCellData {
    
    var id: String { get }
    var iconImage: String { get }
    var name: String { get }
}

struct SubcategoryCellDataProducer: SubcategoryCellData {
    
    var id: String
    var iconImage: String
    var name: String
}
