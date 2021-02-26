//
//  ProductsService.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation
import Moya

class ProductsService {
    
    // MARK: - Public properties
    
    //..
    
    // MARK: - Private properties
    
    private let productsProvider = MoyaProvider<NetworkTarget>()
    private var id: String
    
    init(id: String) {
        
        self.id = id
    }
    
}

// MARK: - Public methods
extension ProductsService {
    
    func getProducts(completion: @escaping (Products?) -> Void) {
        
        productsProvider.request(.products(id: id)) { [weak self] result in
            
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    
                    let products = try JSONDecoder().decode(Products.self, from: response.data)
//                    print(products)
                    completion(products)
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
