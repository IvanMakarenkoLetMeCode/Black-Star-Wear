//
//  AppDesignFont.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

extension AppDesign {
    
    enum Font: String {
        
        case bold = "Bold"
        case regular = "Regular"
        case medium = "Medium"
        
        func with(size: CGFloat) -> UIFont {
            
            let font = UIFont(name: "SFProDisplay-\(self.rawValue)", size: size)
            return font ?? UIFont.systemFont(ofSize: size)
        }
        
    }
    
}
