//
//  AppDesignIcon.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

extension AppDesign {
    
    enum Icon: String {
        
        case cart = "ic_cart"
        case categoryPlaceholder = "ic_category_placeholder"
        
        var value: UIImage {
            
            return UIImage(named: self.rawValue) ?? UIImage()
        }
        
    }
    
}
