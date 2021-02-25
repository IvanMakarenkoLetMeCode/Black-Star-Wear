//
//  ProductsPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit
import RealmSwift

class ProductsPresenter {

    // MARK: - Public properties

    weak var view: ProductsViewInput?
    var router: RouterProtocol?
    let realm = try! Realm()

    // MARK: - Private properties

    private var cellsProducts = [ProductsCellData]()
    private var id: String
    private lazy var productsService = ProductsService(id: id)

    // MARK: - Lifecycle

    required init(view: ProductsViewInput, id: String, router: RouterProtocol) {
        self.view = view
        self.id = id
        self.router = router
    }
    
}

// MARK: - ProductsViewOutput
extension ProductsPresenter: ProductsViewOutput {

    var cells: [ProductsCellData] {

        return cellsProducts
    }

    func onProduct(id: String) {

        router?.showProduct(id: id)
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
private extension ProductsPresenter {

    func setupInitialState() {
        
        self.productsService.getProducts() { [weak self] success in

            guard let self = self, let success = success else { return }
            DispatchQueue.main.async {

                self.buildCells(products: success)
            }
        }
        
    }

    func buildCells(products: Products) {
        
        for product in products.products {
            
            let productDBObject = ProductDBObject(model: product)
            
            try! realm.write {
                realm.add(productDBObject, update: .all)
            }
            
            cellsProducts.append(ProductsCellDataProducer(id: product.id,
                                                          name: product.name,
                                                          description: product.descriptionProduct,
                                                          colorName: product.colorName,
                                                          mainImage: product.mainImage,
                                                          productImages: product.productImages,
                                                          offers: product.offers,
                                                          price: Double(product.price) ?? 0))
        }
        
//        print(cellsProducts)
        view?.collectionViewReloadData()

    }

}
