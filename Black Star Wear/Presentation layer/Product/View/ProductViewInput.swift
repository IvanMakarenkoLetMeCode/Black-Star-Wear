//
//  ProductViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

protocol ProductViewInput: BaseViewInput {
    
    func navigationBarIsHidden(_ bool: Bool)
    func setupContent()
    func cartNotEmpty(color: UIColor, image: UIImage?, cornerRadius: CGFloat, title: String?, textSize: CGFloat?)
}
