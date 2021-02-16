//
//  View.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

extension UIView {
    
    func layoutAttachAll(to view: UIView, insets: UIEdgeInsets = .zero, useSafeArea: Bool = true) {
        
        if useSafeArea {
            
            let guide = view.safeAreaLayoutGuide
            let bottom = bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -insets.bottom)
            let top = topAnchor.constraint(equalTo: guide.topAnchor, constant: insets.top)
            let left = leftAnchor.constraint(equalTo: guide.leftAnchor, constant: insets.left)
            let right = rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -insets.right)
            
            NSLayoutConstraint.activate([bottom, top, left, right])
        }
        else {
            
            let guide = view
            let bottom = bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -insets.bottom)
            let top = topAnchor.constraint(equalTo: guide.topAnchor, constant: insets.top)
            let left = leftAnchor.constraint(equalTo: guide.leftAnchor, constant: insets.left)
            let right = rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -insets.right)
            
            NSLayoutConstraint.activate([bottom, top, left, right])
        }
    }
    
    @objc func fill(view: UIView, insets: UIEdgeInsets = .zero, useSafeArea: Bool = true) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.layoutAttachAll(to: self, insets: insets)
    }
    
}
