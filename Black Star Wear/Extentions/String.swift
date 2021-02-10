//
//  String.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

extension String {
    
    func localized(comment: String = "") -> String {
        
        return NSLocalizedString(self, comment: comment)
    }
    
}
