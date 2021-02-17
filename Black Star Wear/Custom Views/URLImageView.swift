//
//  URLImageView.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit
import SDWebImage

class URLImageView: UIImageView {
    
    // MARK: - Private properties
    
    //..
    
}

// MARK: - Public methods
extension URLImageView {
    
    func setImage(with url: URL?, placeholderImage: UIImage? = nil) {
        
        guard let url = url else {
            
            image = placeholderImage
            return
        }
        sd_setImage(with: url, placeholderImage: placeholderImage)
    }
    
}
