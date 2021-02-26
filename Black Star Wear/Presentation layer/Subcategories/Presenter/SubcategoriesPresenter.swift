//
//  SubcategoriesPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit
import RealmSwift

class SubcategoriesPresenter {
    
    // MARK: - Public properties
    
    weak var view: SubcategoriesViewInput?
    var router: RouterProtocol?
    let realm = try! Realm()
    
    // MARK: - Private properties
    
    private var id: String
    private var token: NotificationToken?
    private var cellsSubcategories = [SubcategoryCellData]()
    
    // MARK: - Lifecycle
    
    required init(view: SubcategoriesViewInput, id: String, router: RouterProtocol) {
        self.view = view
        self.id = id
        self.router = router
    }
    
    deinit {
        token?.invalidate()
        token = nil
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
        
        router?.showCart()
    }
    
    func backButtonDidTap() {
        
        router?.popViewController()
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
        addCartWatcher()
    }
    
    func buildCells() {
        
        guard let categoriesDBObject = realm.objects(CategoryDBObject.self).filter("id = '\(id)'").first else { return }
        for subcategory in categoriesDBObject.subcategories {
            
            cellsSubcategories.append(SubcategoryCellDataProducer(id: subcategory.id ?? "",
                                                                  iconImage: subcategory.iconImage,
                                                                  name: subcategory.name))
        }
        
    }
    
    func addCartWatcher() {

        let results = realm.objects(CartDBObject.self)
        token = results.observe { [weak self] change in
            
            guard let self = self else { return }
            switch change {
            case .initial(let objects):
                self.view?.setupCartButton(count: objects.count)
            case .update(let objects, _, _, _):
                self.view?.setupCartButton(count: objects.count)
            case .error:
                break
            }
        }
    }
    
}
