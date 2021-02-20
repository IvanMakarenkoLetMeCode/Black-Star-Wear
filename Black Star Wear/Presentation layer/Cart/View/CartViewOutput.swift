//
//  CartViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import Foundation

protocol CartViewOutput: BaseViewOutput {
    
    init(view: CartViewInput, products: [ProductsCellData], router: RouterProtocol)
    var cells: [ProductsCellData] { get }
    func crossButtonDidTap()
    func checkoutButtonDidTap()
    func onMainButtonDidTap()
}
