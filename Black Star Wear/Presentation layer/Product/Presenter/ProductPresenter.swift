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
    var product: Product!
    var token: NotificationToken?
    var realm = try! Realm()
    
    // MARK: - Private properties
    
    private var id: String
    private var productCell: ProductsCellData = ProductsCellDataProducer(id: "",
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
    
    var chosedProduct: ProductsCellData {

        return productCell
    }
    
    func addToCartButtonDidTap() {
        
        let cartDBObject = CartDBObject()
        let products = realm.objects(ProductDBObject.self)
        let filteredProduct = products.filter { $0.id == self.id }.first
        if let product = filteredProduct {
            
            cartDBObject.idCategory = id
            cartDBObject.id = product.id
            cartDBObject.name = product.name
            cartDBObject.descriptionProduct = product.descriptionProduct
            cartDBObject.colorName = product.colorName
            cartDBObject.mainImage = product.mainImage
            cartDBObject.productImages = product.productImages
            cartDBObject.offers = product.offers
            cartDBObject.price = product.price
        }
        
        try! realm.write {
            realm.add(cartDBObject, update: .all)
        }
    }
    
    func cartButtonDidTap() {
        
        router?.dismissViewController()
        router?.showCart()
    }
    
    func backButtonDidTap() {
        
        router?.dismissViewController()
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
        
        let products = realm.objects(ProductDBObject.self)
        let filteredProduct = products.filter { $0.id == self.id }.first
        if let product = filteredProduct {
            
            do {
                self.product = try Product(from: product)
            }
            catch {
                print(error)
            }
        }
        
        productCell = ProductsCellDataProducer(id: product.id,
                                               name: product.name,
                                               description: product.descriptionProduct,
                                               colorName: product.colorName,
                                               mainImage: product.mainImage,
                                               productImages: product.productImages,
                                               offers: product.offers,
                                               price: (Double(product.price) ?? 0))
        
    }
    
    func addCartWatcher() {

        let results = realm.objects(CartDBObject.self)
        token = results.observe { change in
            
            switch change {
            case .initial(let objects):
                
                if objects.count == 0 {

                    self.view?.cartNotEmpty(color: .clear,
                                            image: AppDesign.Icon.cart.value,
                                            cornerRadius: 0,
                                            title: nil,
                                            textSize: nil)
                }
                else if objects.count > 0 && objects.count < 100 {

                    self.view?.cartNotEmpty(color: AppDesign.Color.red.ui,
                                            image: nil,
                                            cornerRadius: 10,
                                            title: String(objects.count),
                                            textSize: 12)
                }
                else {

                    self.view?.cartNotEmpty(color: AppDesign.Color.red.ui,
                                            image: nil,
                                            cornerRadius: 10,
                                            title: "..",
                                            textSize: 16)
                }
            case .update(let objects, _, _, _):
                
                if objects.count == 0 {

                    self.view?.cartNotEmpty(color: .clear,
                                            image: AppDesign.Icon.cart.value,
                                            cornerRadius: 0,
                                            title: nil,
                                            textSize: nil)
                }
                else if objects.count > 0 && objects.count < 100 {

                    self.view?.cartNotEmpty(color: AppDesign.Color.red.ui,
                                            image: nil,
                                            cornerRadius: 10,
                                            title: String(objects.count),
                                            textSize: 12)
                }
                else {

                    self.view?.cartNotEmpty(color: AppDesign.Color.red.ui,
                                            image: nil,
                                            cornerRadius: 10,
                                            title: "..",
                                            textSize: 16)
                }
            case .error(let error):
                
                fatalError("\(error)")
            }
        }
    }
    
}
