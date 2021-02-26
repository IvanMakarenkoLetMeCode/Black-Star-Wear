//
//  ProductsViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

protocol ProductsViewInput: BaseViewInput {
    
    func collectionViewReloadData()
    func setupCartButton(count: Int)
}
