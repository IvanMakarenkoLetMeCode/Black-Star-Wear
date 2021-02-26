//
//  CartPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import UIKit
import RealmSwift

class CartPresenter {
    
    // MARK: - Public properties
    
    weak var view: CartViewInput?
    var router: RouterProtocol?
    var realm = try! Realm()
    
    // MARK: - Private properties
    
    private var cartCell = [CartCellData]()
    
    // MARK: - Lifecycle
    
    required init(view: CartViewInput, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

// MARK: - CartViewOutput
extension CartPresenter: CartViewOutput {
    
    var cells: [CartCellData] {
        
        return cartCell
    }
    
    func crossButtonDidTap() {
        
        router?.popViewController()
    }
    
    func checkoutButtonDidTap() {
        
        //..
    }
    
    func onMainButtonDidTap() {
        
        router?.popToRoute()
    }
    
    func deleteButtonDidTap(row: Int) {
        
        let cartDBObjects = realm.objects(CartDBObject.self)
        let cartDBObject = cartDBObjects.filter { $0.id == self.cartCell[row].id }
        try! realm.write {
            realm.delete(cartDBObject)
        }
        
        cartCell.remove(at: row)
        view?.performBatchUpdates(deleteIndexPaths: [IndexPath(row: row, section: 0)])
        view?.setupContent()
        
    }
    
    func viewDidLoad() {
        
        setupInitialState()
    }
    
}

// MARK: - Private methods
private extension CartPresenter {
    
    func setupInitialState() {
        
        buildCells()
        view?.setupContent()
    }
    
    func buildCells() {
        
        let cartDBObjects = realm.objects(CartDBObject.self)
        
        for cartDBObject in cartDBObjects {
            
            do {
                
                let cart = try Cart(from: cartDBObject)
                cartCell.append(CartCellDataProducer(id: cart.id,
                                                             name: cart.name,
                                                             description: cart.descriptionProduct,
                                                             colorName: cart.colorName,
                                                             mainImage: cart.mainImage,
                                                             productImages: cart.productImages,
                                                             offers: cart.offers,
                                                             price: (Double(cart.price) ?? 0)))
            }
            catch {
                print(error)
            }
        }
        
    }
    
}
