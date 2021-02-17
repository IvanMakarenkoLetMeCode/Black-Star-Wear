//
//  SubcategoriesViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import Foundation

protocol SubcategoriesViewOutput: BaseViewOutput {
    
    init(view: SubcategoriesViewInput, subcategories: [Subcategory], router: RouterProtocol)
    var cells: [SubcategoryCellData] { get }
    func onProducts(id: String)
}