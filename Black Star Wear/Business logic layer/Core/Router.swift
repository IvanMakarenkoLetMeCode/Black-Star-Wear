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
    func showSubcategories(id: String)
    func showProducts(id: String)
    func showProduct(id: String)
    func showCart()
    func popViewController()
    func dismissViewController()
    func popToRoute()
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
    
    func showSubcategories(id: String) {
        
        if let navigationController = navigationController {
            guard let subcategoryViewController = assemblyBuilder?
                    .createSubcategoriesModule(id: id, router: self) else { return }
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
    
    func showProduct(id: String) {
        
        if let navigationController = navigationController {
            guard let productViewController = assemblyBuilder?
                    .createProductModule(id: id, router: self) else { return }
            navigationController.pushViewController(productViewController, animated: true)
        }
    }
    
    func showCart() {
        
        if let navigationController = navigationController {
            guard let cartViewController = assemblyBuilder?
                    .createCartModule(router: self) else { return }
            let cartТavigationController = UINavigationController(rootViewController: cartViewController)
            navigationController.present(cartТavigationController, animated: true)
        }
    }
    
    func popViewController() {
        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func dismissViewController() {
        
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true)
        }
    }
    
    func popToRoute() {
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
