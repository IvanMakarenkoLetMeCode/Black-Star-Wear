//
//  ProductViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 18.02.2021.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    private var productImageView = URLImageView()
    private let screenSize: CGRect = UIScreen.main.bounds
    private var model: ProductImages?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ProductImages) {
        
        self.model = model
        if let imageURL = model.imageURL {
            let urlString = "https://blackstarshop.ru/" + imageURL
            let url = URL(string: urlString)
            productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
        }
        else {
            let url = URL(string: model.imageURL ?? "")
            productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
        }
        
    }
    
}

// MARK: - Private methods
private extension ProductViewCell {
    
    func setupUI() {
        
        contentView.backgroundColor = AppDesign.Color.white.ui
        contentView.fill(view: productImageView)
        productImageView.contentMode = .scaleAspectFill
        productImageView.widthAnchor.constraint(equalToConstant: screenSize.width).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: screenSize.width).isActive = true
    }
    
}
