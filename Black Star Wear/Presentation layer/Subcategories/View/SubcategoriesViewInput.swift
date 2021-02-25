//
//  SubcategoriesViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit

protocol SubcategoriesViewInput: BaseViewInput {
    
    func tableViewReloadData()
    func cartNotEmpty(color: UIColor, image: UIImage?, title: String?)
}
