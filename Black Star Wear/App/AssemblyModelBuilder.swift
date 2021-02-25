//
//  AssemblyModelBuilder.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit
protocol AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController
    func createSubcategoriesModule(id: String, router: RouterProtocol) -> UIViewController
    func createProductsModule(id: String, router: RouterProtocol) -> UIViewController
    func createProductModule(id: String, router: RouterProtocol) -> UIViewController
    func createCartModule(router: RouterProtocol) -> UIViewController
    
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController {
        
        let view = CategoriesViewController()
        view.title = "Категории".localized()
        let presenter = CategoriesPresenter(view: view, router: router)
        view.output = presenter
        return view
    }
    
    func createSubcategoriesModule(id: String, router: RouterProtocol) -> UIViewController {
        
        let view = SubcategoriesViewController()
        view.title = "Подкатегории".localized()
        let presenter = SubcategoriesPresenter(view: view, id: id, router: router)
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
    
    func createProductModule(id: String, router: RouterProtocol) -> UIViewController {
        
        let view = ProductViewController()
        let presenter = ProductPresenter(view: view, id: id, router: router)
        view.output = presenter
        return view
    }
    
    func createCartModule(router: RouterProtocol) -> UIViewController {
        
        let view = CartViewController()
        view.title = "Корзина".localized()
        let presenter = CartPresenter(view: view, router: router)
        view.output = presenter
        return view
    }
    
}
