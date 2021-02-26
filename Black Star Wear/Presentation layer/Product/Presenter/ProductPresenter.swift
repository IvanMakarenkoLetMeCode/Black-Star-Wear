//
//  ProductPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit
import RealmSwift

class ProductPresenter {

    // MARK: - Public properties

    weak var view: ProductViewInput?
    var router: RouterProtocol?
    var token: NotificationToken?
    var realm = try! Realm()
    
    // MARK: - Private properties
    
    private var id: String
    private var productCell: ProductViewData = ProductViewDataProducer(id: "",
                                                                     name: "",
                                                                     description: "",
                                                                     colorName: "",
                                                                     mainImage: "",
                                                                     productImages: [],
                                                                     offers: [],
                                                                     price: 0)
    
    // MARK: - Lifecycle

    required init(view: ProductViewInput, id: String, router: RouterProtocol) {
        self.view = view
        self.id = id
        self.router = router
    }
    
}

// MARK: - ProductViewOutput
extension ProductPresenter: ProductViewOutput {
    
    var chosedProduct: ProductViewData {

        return productCell
    }
    
    func addToCartButtonDidTap() {
        
        let cartDBObject = CartDBObject()
        guard let product = realm.objects(ProductDBObject.self).filter("id = '\(id)'").first else { return }
        cartDBObject.idCategory = id
        cartDBObject.idProduct = product.id
        cartDBObject.id = UUID().uuidString
        cartDBObject.name = product.name
        cartDBObject.descriptionProduct = product.descriptionProduct
        cartDBObject.colorName = product.colorName
        cartDBObject.mainImage = product.mainImage
        cartDBObject.productImages = product.productImages
        cartDBObject.offers = product.offers
        cartDBObject.price = product.price

        try! realm.write {
            realm.add(cartDBObject, update: .all)
        }
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
    
    func viewWillAppear() {
        
        view?.navigationBarIsHidden(true)
    }
    
    func viewWillDisappear() {
        
        view?.navigationBarIsHidden(false)
    }
    
}

// MARK: - Private methods
private extension ProductPresenter {

    func setupInitialState() {
        
        buildCells()
        view?.setupContent()
        addCartWatcher()
    }
    
    func buildCells() {
        
        guard let productDBObject = realm.objects(ProductDBObject.self).filter("id = '\(id)'").first else { return }
        do {
            let product = try Product(from: productDBObject)
            productCell = ProductViewDataProducer(id: product.id,
                                                   name: product.name,
                                                   description: product.descriptionProduct,
                                                   colorName: product.colorName,
                                                   mainImage: product.mainImage,
                                                   productImages: product.productImages,
                                                   offers: product.offers,
                                                   price: (Double(product.price) ?? 0))
        }
        catch {
            print(error)
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
