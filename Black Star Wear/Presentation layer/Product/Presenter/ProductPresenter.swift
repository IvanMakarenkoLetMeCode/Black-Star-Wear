//
//  ProductPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

class ProductPresenter {

    // MARK: - Public properties

    weak var view: ProductViewInput?
    var router: RouterProtocol?

    // MARK: - Private properties

    private var product: ProductsCellData

    // MARK: - Lifecycle

    required init(view: ProductViewInput, product: ProductsCellData, router: RouterProtocol) {
        self.view = view
        self.product = product
        self.router = router
    }
    
}

// MARK: - ProductViewOutput
extension ProductPresenter: ProductViewOutput {
    
    var chosedProduct: ProductsCellData {

        return product
    }
    
    func addToCartButtonDidTap() {
        
        //..
    }
    
    func cartButtonDidTap() {
        
        router?.dismissViewController()
        router?.showCart(products: [])
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
        
        view?.setupContent()
    }

}
