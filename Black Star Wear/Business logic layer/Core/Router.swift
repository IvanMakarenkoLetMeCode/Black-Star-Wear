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
    
    func showSubcategories(subcategories: [Subcategory]) {
        
        if let navigationController = navigationController {
            guard let subcategoryViewController = assemblyBuilder?
                    .createSubcategoriesModule(subcategories: subcategories, router: self) else { return }
            navigationController.pushViewController(subcategoryViewController, animated: true)
        }
    }
    
    func showProducts(id: String) {
        
        if let navigationController = navigationController {
            guard let subcategoryViewController = assemblyBuilder?
                    .createProductsModule(id: id, router: self) else { return }
            navigationController.pushViewController(subcategoryViewController, animated: true)
        }
    }
    
    func popToRoute() {
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
