//
//  AssemblyModelBuilder.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit
protocol AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController
    func createSubcategoriesModule(subcategories: [Subcategory], router: RouterProtocol) -> UIViewController
    func createProductsModule(id: String, router: RouterProtocol) -> UIViewController
    func createProductModule(product: ProductsCellData, router: RouterProtocol) -> UIViewController
    
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController {
        let view = CategoriesViewController()
        view.title = "Категории".localized()
        let presenter = CategoriesPresenter(view: view, router: router)
        view.output = presenter
        return view
    }
    
    func createSubcategoriesModule(subcategories: [Subcategory],
                                   router: RouterProtocol) -> UIViewController {
        
        let view = SubcategoriesViewController()
        view.title = "Подкатегории".localized()
        let presenter = SubcategoriesPresenter(view: view, subcategories: subcategories, router: router)
        view.output = presenter
        return view
        
    }
    
    func createProductsModule(id: String, router: RouterProtocol) -> UIViewController {
        
        let view = ProductsViewController()
        view.title = "Товары".localized()
        let presenter = ProductsPresenter(view: view, id: id, router: router)
        view.output = presenter
        return view
        
    }
    
    func createProductModule(product: ProductsCellData, router: RouterProtocol) -> UIViewController {
        
        let view = ProductViewController()
        let presenter = ProductPresenter(view: view, product: product, router: router)
        view.output = presenter
        return view
        
    }
    
}
