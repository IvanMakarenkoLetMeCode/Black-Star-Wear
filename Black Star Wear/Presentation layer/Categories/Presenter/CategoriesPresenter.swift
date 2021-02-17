//
//  CategoriesPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

class CategoriesPresenter {
    
    // MARK: - Public properties
    
    weak var view: CategoriesViewInput?
    var router: RouterProtocol?
    
    // MARK: - Private properties
    
    private var cellsCategories = [CategoryCellData]()
    private lazy var categoriesService = CategoriesService()
    
    // MARK: - Lifecycle
    
    required init(view: CategoriesViewInput, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

// MARK: - CategoriesViewOutput
extension CategoriesPresenter: CategoriesViewOutput {
    
    var cells: [CategoryCellData] {
        
        return cellsCategories
    }
    
    func onSubcategories(subcategories: [Subcategory]) {
        
        router?.showSubcategories(subcategories: subcategories)
    }
    
    func onProducts(id: String) {
        
        router?.showProducts(id: id)
    }
    
    func viewDidLoad() {
        
        setupInitialState()
    }
    
}

// MARK: - Private methods
private extension CategoriesPresenter {
    
    func setupInitialState() {
        
        
        
        self.categoriesService.getCategories() { [weak self] success in

            guard let self = self, let success = success else { return }
            DispatchQueue.main.async {

                self.buildCells(categories: success)
            }
        }
        
    }
    
    func buildCells(categories: Categories) {
        
        for category in categories.categories {
            
            cellsCategories.append(CategoryCellDataProducer(id: category.id,
                                                       name: category.name,
                                                       sortOrder: category.sortOrder ?? "",
                                                       image: category.image,
                                                       iconImage: category.iconImage,
                                                       iconImageActive: category.iconImageActive,
                                                       subcategories: category.subcategories ?? []))
            
        }
        
        view?.tableViewReloadData()
        
    }
    
}
