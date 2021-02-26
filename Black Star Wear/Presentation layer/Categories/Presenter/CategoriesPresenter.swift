//
//  CategoriesPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit
import RealmSwift

class CategoriesPresenter {
    
    // MARK: - Public properties
    
    weak var view: CategoriesViewInput?
    var router: RouterProtocol?
    var token: NotificationToken?
    let realm = try! Realm()
    
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
    
    func onSubcategories(id: String) {
        
        router?.showSubcategories(id: id)
    }
    
    func onProducts(id: String) {
        
        router?.showProducts(id: id)
    }
    
    func cartButtonDidTap() {
        
        router?.showCart()
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
                
                self.addCategoriesToDBO(categories: success)
                self.buildCells(categories: success)
            }
        }
        addCartWatcher()
    }
    
    func buildCells(categories: Categories) {
        
        for category in categories.categories {
            
            cellsCategories.append(CategoryCellDataProducer(id: category.id,
                                                       name: category.name,
                                                       image: category.image,
                                                       subcategories: category.subcategories))
            
        }
        
        view?.tableViewReloadData()
        
    }
    
    func addCategoriesToDBO(categories: Categories) {
        
        for category in categories.categories {
            
            let categoryDBObject = CategoryDBObject(model: category)
            
            try! realm.write {
                realm.add(categoryDBObject, update: .all)
            }
        }
        
    }
    
    func addCartWatcher() {

        let results = realm.objects(CartDBObject.self)
        token = results.observe { change in
            
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
