//
//  CategoriesViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

protocol CategoriesViewInput: BaseViewInput {
    
    func tableViewReloadData()
    func setupCartButton(count: Int)
}
