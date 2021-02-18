//
//  VButton.swift
//  Black Star Wear
//
//  Created by Ivan on 18.02.2021.
//

import UIKit

class VButton: UIButton {
    
}

// MARK: - Public methods
extension VButton {
    
    func setTitle(_ title: String?, for states: [UIControl.State] = [.normal, .selected, .disabled]) {
        
        states.forEach {
            
            setTitle(title, for: $0)
        }
    }
    
    func setAttributedTitle(_ title: NSAttributedString?,
                            for states: [UIControl.State] = [.normal, .selected, .disabled]) {
        
        states.forEach {
            
            setAttributedTitle(title, for: $0)
        }
    }
    
    func setTitleColor(_ color: UIColor?, for states: [UIControl.State] = [.normal, .selected, .disabled]) {
        
        states.forEach {
            
            setTitleColor(color, for: $0)
        }
    }
    
    func setFont(_ font: UIFont) {
        
        titleLabel?.font = font
    }
    
    func setImage(_ image: UIImage?, for states: [UIControl.State] = [.normal, .selected, .disabled]) {
        
        states.forEach {
            
            setImage(image, for: $0)
        }
    }
    
}
