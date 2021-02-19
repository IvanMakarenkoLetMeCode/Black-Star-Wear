//
//  CartViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import Foundation

protocol CartViewOutput: BaseViewOutput {
    
    init(view: CartViewInput, navigationBarHidden: Bool, products: [ProductsCellData], router: RouterProtocol)
    var cells: [ProductsCellData] { get set }
    func crossButtonDidTap()
    func checkoutButtonDidTap()
    func onMainButtonDidTap()
}
