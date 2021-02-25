//
//  Cart.swift
//  Black Star Wear
//
//  Created by Ivan on 24.02.2021.
//

import RealmSwift

struct Cart {
    
    var idCategory: String
    var id: String
    var name: String
    var descriptionProduct: String
    var colorName: String
    var mainImage: String
    var productImages: [ProductImages]
    var offers: [Offers]
    var price: String
    
    init(from dbObject: CartDBObject) throws {
        
        idCategory = dbObject.idCategory
        id = dbObject.id
        name = dbObject.name
        descriptionProduct = dbObject.descriptionProduct
        colorName = dbObject.colorName
        mainImage = dbObject.mainImage
        productImages = try dbObject.productImages.map { try ProductImages(from: $0) }
        offers = try dbObject.offers.map { try Offers(from: $0) }
        price = dbObject.price
    }
    
}

class CartDBObject: Object {
    
    override class func primaryKey() -> String? { return "id" }
    @objc dynamic var idCategory: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionProduct: String = ""
    @objc dynamic var colorName: String = ""
    @objc dynamic var mainImage: String = ""
    var productImages = List<ProductImagesDBObject>()
    var offers = List<OffersDBObject>()
    @objc dynamic var price: String = ""
    
    convenience init(model: Cart) {
        
        self.init()
        idCategory = model.idCategory
        id = model.id
        name = model.name
        descriptionProduct = model.descriptionProduct
        colorName = model.colorName
        mainImage = model.mainImage
        productImages.append(objectsIn: model.productImages.map { ProductImagesDBObject(model: $0) })
        offers.append(objectsIn: model.offers.map { OffersDBObject(model: $0) })
        price = model.price
    }
    
}
