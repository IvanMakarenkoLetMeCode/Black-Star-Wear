//
//  ProductsPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

class ProductsPresenter {

    // MARK: - Public properties

    weak var view: ProductsViewInput?
    var router: RouterProtocol?

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

    func onProduct(product: ProductsCellData) {

        router?.showProduct(product: product)
    }
    
    func cartButtonDidTap() {
        
        router?.showCart(products: cellsProducts)
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
            
            cellsProducts.append(ProductsCellDataProducer(name: product.name ?? "",
                                                          englishName: product.englishName ?? "",
                                                          sortOrder: product.sortOrder ?? "",
                                                          article: product.article ?? "",
                                                          collection: product.collection ?? "",
                                                          description: product.description ?? "",
                                                          colorName: product.colorName ?? "",
                                                          colorImageURL: product.colorImageURL ?? "",
                                                          mainImage: product.mainImage ?? "",
                                                          productImages: product.productImages,
                                                          offers: product.offers,
                                                          recommendedProductIDs: product.recommendedProductIDs,
                                                          price: Double(product.price ?? "") ?? 0,
                                                          attributes: product.attributes))
        }
        
//        print(cellsProducts)
        view?.collectionViewReloadData()

    }

}
