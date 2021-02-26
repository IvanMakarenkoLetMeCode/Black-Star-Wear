//
//  Product.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import RealmSwift

struct Product: Decodable {
    
    var idCategory: String = ""
    var id: String
    var name: String
    var descriptionProduct: String
    var colorName: String
    var mainImage: String
    var productImages: [ProductImages]
    var offers: [Offers]
    var price: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case descriptionProduct = "description"
        case colorName = "colorName"
        case mainImage = "mainImage"
        case productImages = "productImages"
        case offers = "offers"
        case price = "price"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = container.codingPath.first!.stringValue
        name = try container.decode(String.self, forKey: .name)
        descriptionProduct = try container.decode(String.self, forKey: .descriptionProduct)
        colorName = try container.decode(String.self, forKey: .colorName)
        mainImage = "https://blackstarshop.ru/" + (try container.decode(String.self, forKey: .mainImage))
        productImages = (try? container.decode([ProductImages].self, forKey: .productImages)) ?? []
        offers = (try? container.decode([Offers].self, forKey: .offers)) ?? []
        price = try container.decode(String.self, forKey: .price)
    }
    
    init(from dbObject: ProductDBObject) throws {
        
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

class ProductDBObject: Object {
    
    override class func primaryKey() -> String? { return "id" }
    @objc dynamic var idCategory: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionProduct: String = ""
    @objc dynamic var colorName: String = ""
    @objc dynamic var mainImage: String = ""
    let productImages = List<ProductImagesDBObject>()
    let offers = List<OffersDBObject>()
    @objc dynamic var price: String = ""
    
    convenience init(model: Product) {
        
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
