//
//  ProductViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import Foundation

protocol ProductViewOutput: BaseViewOutput {
    
    init(view: ProductViewInput, product: ProductsCellData, router: RouterProtocol)
    var chosedProduct: ProductsCellData { get }
    func addToCartButtonDidTap()
    func cartButtonDidTap()
    func backButtonDidTap()
}
