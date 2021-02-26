//
//  Subcategory.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import RealmSwift

struct Subcategory: Decodable {
    
    var id: String?
    var iconImage: String
    var sortOrder: String?
    var name: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case iconImage = "iconImage"
        case sortOrder = "sortOrder"
        case name = "name"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        iconImage = "https://blackstarshop.ru/" + (try container.decode(String.self, forKey: .iconImage))
        sortOrder = try? container.decode(String.self, forKey: .sortOrder)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
    }
    
    init(from dbObject: SubcategoryDBObject) throws {
        
        id = dbObject.id
        iconImage = dbObject.iconImage
        sortOrder = dbObject.sortOrder
        name = dbObject.name
        type = dbObject.type
    }
    
}

class SubcategoryDBObject: Object {
    
    override class func primaryKey() -> String? { return "id" }
    @objc dynamic var id: String? = ""
    @objc dynamic var iconImage: String = ""
    @objc dynamic var sortOrder: String? = ""
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    
    convenience init(model: Subcategory) {
        
        self.init()
        id = model.id
        iconImage = model.iconImage
        sortOrder = model.sortOrder
        name = model.name
        type = model.type
    }
    
}
