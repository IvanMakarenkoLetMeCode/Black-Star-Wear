//
//  Categories.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

struct Categories: Decodable {

    var item_263: Category
    var accessories: Category
    var female: Category
    var male: Category
    var children: Category
    var collections: Category
    var preOrder_123: Category
    var discounts: Category
    var newItems: Category
    var marketplace: Category
    var preOrder_0: Category


    enum CodingKeys: String, CodingKey {

        case item_263 = "263"
        case accessories = "67"
        case female = "68"
        case male = "69"
        case children = "73"
        case collections = "74"
        case preOrder_123 = "123"
        case discounts = "156"
        case newItems = "165"
        case marketplace = "233"
        case preOrder_0 = "0"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        item_263 = try container.decode(Category.self, forKey: .item_263)
        accessories = try container.decode(Category.self, forKey: .accessories)
        female = try container.decode(Category.self, forKey: .female)
        male = try container.decode(Category.self, forKey: .male)
        children = try container.decode(Category.self, forKey: .children)
        collections = try container.decode(Category.self, forKey: .collections)
        preOrder_123 = try container.decode(Category.self, forKey: .preOrder_123)
        discounts = try container.decode(Category.self, forKey: .discounts)
        newItems = try container.decode(Category.self, forKey: .newItems)
        marketplace = try container.decode(Category.self, forKey: .marketplace)
        preOrder_0 = try container.decode(Category.self, forKey: .preOrder_0)
    }

}
