//
//  ProductViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import Foundation

protocol ProductViewInput: BaseViewInput {
    
    func navigationBarIsHidden(_ bool: Bool)
    func setupContent()
}
