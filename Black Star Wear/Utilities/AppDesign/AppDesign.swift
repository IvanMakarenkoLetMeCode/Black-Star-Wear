//
//  AppDesign.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

enum AppDesign {
    
    case constants
    
    var cornerRadius: CGFloat { return 10.0 }
    var largeCornerRadius: CGFloat { return 20.0 }
    var borderWidth: CGFloat { return 1.0 }
    
    var leftNavigationItemOffset: CGFloat { return 8.0 }
    var rightNavigationItemOffset: CGFloat { return 4.0 }
    var contentInset: UIEdgeInsets { return UIEdgeInsets(top: 12, left: 28, bottom: 12, right: 28) }
}
