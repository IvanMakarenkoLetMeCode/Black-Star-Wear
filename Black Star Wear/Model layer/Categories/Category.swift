//
//  Category.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import RealmSwift

struct Category: Decodable {
    
    var id: String
    var name: String
    var sortOrder: String?
    var image: String
    var iconImage: String
    var iconImageActive: String
    var subcategories: [Subcategory]
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case sortOrder = "sortOrder"
        case image = "image"
        case iconImage = "iconImage"
        case iconImageActive = "iconImageActive"
        case subcategories = "subcategories"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = container.codingPath.first!.stringValue
        name = try container.decode(String.self, forKey: .name)
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
        image = "https://blackstarshop.ru/" + (try container.decode(String.self, forKey: .image))
        iconImage = try container.decode(String.self, forKey: .iconImage)
        iconImageActive = try container.decode(String.self, forKey: .iconImageActive)
        subcategories = (try? container.decode([Subcategory].self, forKey: .subcategories)) ?? []
    }
    
    init(from dbObject: CategoryDBObject) throws {
        
        id = dbObject.id
        name = dbObject.name
        sortOrder = dbObject.sortOrder
        image = dbObject.image
        iconImage = dbObject.iconImage
        iconImageActive = dbObject.iconImageActive
        subcategories = try dbObject.subcategories.map { try Subcategory(from: $0) }
    }
    
}

class CategoryDBObject: Object {
    
    override class func primaryKey() -> String? { return "id" }
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var sortOrder: String? = ""
    @objc dynamic var image: String = ""
    @objc dynamic var iconImage: String = ""
    @objc dynamic var iconImageActive: String = ""
    let subcategories = List<SubcategoryDBObject>()
    
    convenience init(model: Category) {
        
        self.init()
        id = model.id
        name = model.name
        sortOrder = model.sortOrder
        image = model.image
        iconImage = model.iconImage
        iconImageActive = model.iconImageActive
        subcategories.append(objectsIn: model.subcategories.map { SubcategoryDBObject(model: $0) })
    }
    
}
