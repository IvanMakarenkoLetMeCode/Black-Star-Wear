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
        /// Hex: ##7F807F
        case grey = "co_grey"
        /// Hex: #007AFF
        case blue = "co_blue"
        /// Hex: #FF0000
        case red = "co_red"
        /// Opacity = 0
        case clear = "co_clear"
        /// Hex: #68
        case navigationBar = "co_navigation_bar"
        /// Hex: #E0E0E0
        case separator = "co_separator"
        
        var ui: UIColor {
            
            return UIColor(named: self.rawValue) ?? .black
        }
        
        var cg: CGColor {
            
            return ui.cgColor
        }
        
    }
    
}
