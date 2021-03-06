//
//  CartViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import Foundation

protocol CartViewOutput: BaseViewOutput {
    
    init(view: CartViewInput, router: RouterProtocol)
    var cells: [CartCellData] { get }
    func crossButtonDidTap()
    func checkoutButtonDidTap()
    func onMainButtonDidTap()
    func deleteButtonDidTap(row: Int)
}
