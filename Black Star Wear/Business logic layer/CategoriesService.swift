//
//  CategoriesService.swift
//  Black Star Wear
//
//  Created by Ivan on 15.02.2021.
//

import Foundation
import Moya

class CategoriesService {
    
    // MARK: - Public properties
    
    //..
    
    // MARK: - Private properties
    
    private let categoriesProvider = MoyaProvider<NetworkTarget>()
}

// MARK: - Public methods
extension CategoriesService {
    
    func getCategories(completion: @escaping (Categories?) -> Void) {
        
        categoriesProvider.request(.categories) { result in
                
                switch result {
                case .success(let response):
                    do {
                        
                        let categories = try JSONDecoder().decode(Categories.self, from: response.data)
//                        print(categories)
                        completion(categories)
                    }
                    catch let error {
                        print(error)
                        completion(nil)
                    }
                case .failure(let error):
                    print(error)
                    completion(nil)
                }
        }
        
    }
    
}
