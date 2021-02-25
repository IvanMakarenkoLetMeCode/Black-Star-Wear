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
    var product: Cart!
    var realm = try! Realm()
    
    // MARK: - Private properties
    
    private var products = [Cart]()
    private var productsCell = [ProductsCellData]()
    private var cellsDeleted: [IndexPath]?
    
    // MARK: - Lifecycle
    
    required init(view: CartViewInput, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

// MARK: - CartViewOutput
extension CartPresenter: CartViewOutput {
    
    var cells: [ProductsCellData] {
        
        return productsCell
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
        let cartDBObject = cartDBObjects.filter { $0.id == self.productsCell[row].id }
        try! realm.write {
            realm.delete(cartDBObject)
        }
        
        productsCell.remove(at: row)
        cellsDeleted = []
        cellsDeleted?.append(IndexPath(row: row, section: 0))
        if let cellsDeleted = cellsDeleted {
            view?.performBatchUpdates(deleteIndex: cellsDeleted)
        }
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
                product = try Cart(from: cartDBObject)
            } catch {
                print(error)
            }
            products.append(product)
        }
        
        for product in products {
            
            productsCell.append(ProductsCellDataProducer(id: product.id,
                                                         name: product.name,
                                                         description: product.descriptionProduct,
                                                         colorName: product.colorName,
                                                         mainImage: product.mainImage,
                                                         productImages: product.productImages,
                                                         offers: product.offers,
                                                         price: (Double(product.price) ?? 0)))
        }
        
    }
    
}
