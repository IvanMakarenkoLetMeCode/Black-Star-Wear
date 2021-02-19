//
//  Router.swift
//  Black Star Wear
//
//  Created by Ivan on 15.02.2021.
//

import UIKit

protocol RouterMain {
    
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    
    func initialViewController()
    func showSubcategories(subcategories: [Subcategory])
    func showProducts(id: String)
    func showProduct(product: ProductsCellData)
    func showCart(navigationBarHidden: Bool, products: [ProductsCellData])
    func popToRoute()
    func popViewController(isNavigationBarHidden: Bool)
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        
        if let navigationController = navigationController {
            guard let categoryViewController = assemblyBuilder?.createCategoriesModule(router: self) else { return }
            navigationController.viewControllers = [categoryViewController]
        }
    }
    
    func showSubcategories(subcategories: [Subcategory]) {
        
        if let navigationController = navigationController {
            guard let subcategoryViewController = assemblyBuilder?
                    .createSubcategoriesModule(subcategories: subcategories, router: self) else { return }
            navigationController.pushViewController(subcategoryViewController, animated: true)
        }
    }
    
    func showProducts(id: String) {
        
        if let navigationController = navigationController {
            guard let productsViewController = assemblyBuilder?
                    .createProductsModule(id: id, router: self) else { return }
            navigationController.pushViewController(productsViewController, animated: true)
        }
    }
    
    func showProduct(product: ProductsCellData) {
        
        if let navigationController = navigationController {
            guard let productViewController = assemblyBuilder?
                    .createProductModule(product: product, router: self) else { return }
            navigationController.isNavigationBarHidden = true
            navigationController.pushViewController(productViewController, animated: true)
        }
    }
    
    func showCart(navigationBarHidden: Bool, products: [ProductsCellData]) {
        
        if let navigationController = navigationController {
            guard let cartViewController = assemblyBuilder?
                    .createCartModule(navigationBarHidden: navigationBarHidden, products: products, router: self) else { return }
            navigationController.isNavigationBarHidden = false
            navigationController.pushViewController(cartViewController, animated: true)
        }
    }
    
    func popViewController(isNavigationBarHidden: Bool) {
        
        if let navigationController = navigationController {
            navigationController.isNavigationBarHidden = isNavigationBarHidden
            navigationController.popViewController(animated: true)
        }
    }
    
    func popToRoute() {
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
