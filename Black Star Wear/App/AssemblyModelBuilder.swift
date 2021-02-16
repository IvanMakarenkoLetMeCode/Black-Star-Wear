//
//  AssemblyModelBuilder.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit
protocol AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    
    func createCategoriesModule(router: RouterProtocol) -> UIViewController {
        let view = CategoriesViewController()
        view.title = "Categories".localized()
        let presenter = CategoriesPresenter(view: view, router: router)
        view.output = presenter
        return view
    }
    
}
