//
//  AppDesignColor.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

extension AppDesign {
    
    enum Color: String {
        
        /// Hex: #FFFFFF
        case background = "co_background"
        /// Hex: #000000
        case title = "co_title"
        /// Hex: #000000
        case black = "co_black"
        /// Hex: #FFFFFF
        case white = "co_white"
        
        var ui: UIColor {
            
            return UIColor(named: self.rawValue) ?? .black
        }
        
        var cg: CGColor {
            
            return ui.cgColor
        }
        
    }
    
}
