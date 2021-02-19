//
//  CategoriesViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import Foundation

protocol CategoriesViewOutput: BaseViewOutput {
    
    init(view: CategoriesViewInput, router: RouterProtocol)
    var cells: [CategoryCellData] { get }
    func onSubcategories(subcategories: [Subcategory])
    func onProducts(id: String)
    func cartButtonDidTap()
}
