//
//  CategoriesViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

protocol CategoriesViewInput: BaseViewInput {
    
    func tableViewReloadData()
    func cartNotEmpty(color: UIColor, image: UIImage?, cornerRadius: CGFloat, title: String?, textSize: CGFloat?)
}
