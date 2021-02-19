//
//  SubcategoriesPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit

class SubcategoriesPresenter {
    
    // MARK: - Public properties
    
    weak var view: SubcategoriesViewInput?
    var router: RouterProtocol?
    
    // MARK: - Private properties
    
    private var cellsSubcategories = [SubcategoryCellData]()
    private var subcategories = [Subcategory]()
    
    // MARK: - Lifecycle
    
    required init(view: SubcategoriesViewInput, subcategories: [Subcategory], router: RouterProtocol) {
        self.view = view
        self.subcategories = subcategories
        self.router = router
    }
    
}

// MARK: - SubcategoriesViewOutput
extension SubcategoriesPresenter: SubcategoriesViewOutput {
    
    var cells: [SubcategoryCellData] {
        
        return cellsSubcategories
    }
    
    func onProducts(id: String) {
        
        router?.showProducts(id: id)
    }
    
    func cartButtonDidTap() {
        
        router?.showCart(navigationBarHidden: false, products: [])
    }
    
    func backButtonDidTap() {
        
        router?.popViewController(isNavigationBarHidden: false)
    }
    
    func viewDidLoad() {
        
        setupInitialState()
    }
    
}

// MARK: - Private methods
private extension SubcategoriesPresenter {
    
    func setupInitialState() {
        
        buildCells()
        view?.tableViewReloadData()
    }
    
    func buildCells() {
        
        for subcategory in subcategories {
            
            cellsSubcategories.append(SubcategoryCellDataProducer(id: subcategory.id ?? "",
                                                                  iconImage: subcategory.iconImage,
                                                                  sortOrder: subcategory.sortOrder ?? "",
                                                                  name: subcategory.name,
                                                                  type: subcategory.type))
        }
        
    }
    
}
