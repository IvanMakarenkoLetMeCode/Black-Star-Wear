//
//  ProductsViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import Foundation

protocol ProductsViewOutput: BaseViewOutput {
    
    init(view: ProductsViewInput, id: String, router: RouterProtocol)
    var cells: [ProductsCellData] { get }
    func onProduct(product: ProductsCellData)
    func cartButtonDidTap()
    func backButtonDidTap()
}
