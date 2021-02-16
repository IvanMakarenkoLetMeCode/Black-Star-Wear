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
    
    func onSubcategories(id: Int?) {
        
        router?.showSubcategories(id: id)
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
                self.buildCells(categories: [success.item_263,
                                             success.accessories,
                                             success.children,
                                             success.collections,
                                             success.discounts,
                                             success.female,
                                             success.male,
                                             success.marketplace,
                                             success.newItems,
                                             success.preOrder_0,
                                             success.preOrder_123])
            }
        }
        
    }
    
    func buildCells(categories: [Category]) {
        
        for category in categories {
            
            cellsCategories.append(CategoryCellDataProducer(name: category.name,
                                                            sortOrder: category.sortOrder ?? "",
                                                            image: category.image,
                                                            iconImage: category.iconImage,
                                                            iconImageActive: category.iconImageActive,
                                                            subcategories: category.subcategories ?? []))
        }
        
        view?.tableViewReloadData()
        
    }
    
}
