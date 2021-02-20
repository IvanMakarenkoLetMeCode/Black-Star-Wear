//
//  AppDesignFontName.swift
//  Black Star Wear
//
//  Created by Ivan on 18.02.2021.
//

import UIKit

extension AppDesign {
    
    enum FontName: String {
        
        case sfProDisplay = "SFProDisplay"
        case roboto = "Roboto"
        case akzidenzGroteskPro = "AkzidenzGroteskPro"
        
        func boldWith(size: CGFloat) -> UIFont {
            
            let font = UIFont(name: "\(self.rawValue)-Bold", size: size)
            return font ?? UIFont.systemFont(ofSize: size)
        }
        
        func regularWith(size: CGFloat) -> UIFont {
            
            let font = UIFont(name: "\(self.rawValue)-Regular", size: size)
            return font ?? UIFont.systemFont(ofSize: size)
        }
        
        func mediumWith(size: CGFloat) -> UIFont {
            
            let font = UIFont(name: "\(self.rawValue)-Medium", size: size)
            return font ?? UIFont.systemFont(ofSize: size)
        }
        
    }
    
}
