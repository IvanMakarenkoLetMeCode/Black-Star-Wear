//
//  CartPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import UIKit

class CartPresenter {
    
    // MARK: - Public properties
    
    weak var view: CartViewInput?
    var router: RouterProtocol?
    
    // MARK: - Private properties
    
    private var navigationBarHidden: Bool
    private var products: [ProductsCellData]
    
    // MARK: - Lifecycle
    
    required init(view: CartViewInput, navigationBarHidden: Bool, products: [ProductsCellData], router: RouterProtocol) {
        self.view = view
        self.navigationBarHidden = navigationBarHidden
        self.products = products
        self.router = router
    }
    
}

// MARK: - CartViewOutput
extension CartPresenter: CartViewOutput {
    
    var cells: [ProductsCellData] {
        
        get {
            products
        }
        set {
            products = newValue
        }
    }
    
    func crossButtonDidTap() {
        
        router?.popViewController(isNavigationBarHidden: navigationBarHidden)
    }
    
    func checkoutButtonDidTap() {
        
        //..
    }
    
    func onMainButtonDidTap() {
        
        router?.popToRoute()
    }
    
    func viewDidLoad() {
        
        setupInitialState()
    }
    
}

// MARK: - Private methods
private extension CartPresenter {
    
    func setupInitialState() {
        
        view?.setupContent()
//        view?.tableViewReloadData()
    }
    
}
