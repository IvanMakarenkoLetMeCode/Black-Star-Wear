//
//  NetworkService.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit
import Moya

enum NetworkService {
    
    case categories
    case products(id: Int)
}

extension NetworkService: TargetType {
    
    //MARK: - URL
    //https://blackstarshop.ru/index.php?route=api/v1/categories
    //https://blackstarshop.ru/index.php?route=api/v1/products&cat_id={id категории}
    
    var baseURL: URL{
        return URL(string: "https://blackstarshop.ru")!
    }
    
    var path: String {
        switch self {
        case .categories:
            return "/index.php"
            
        case .products:
            return "/index.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .categories, .products:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .categories, .products:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .categories:
            return .requestParameters(parameters: ["route": "api/v1/categories"], encoding: URLEncoding.queryString)
            
        case .products(let id):
            return .requestParameters(parameters: ["route": "api/v1/product", "cat_id": id],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
