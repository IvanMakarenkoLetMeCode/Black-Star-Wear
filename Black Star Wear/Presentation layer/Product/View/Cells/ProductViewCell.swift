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
    private var model: ProductImages?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    override func prepareForReuse() {
        
        productImageView.sd_cancelCurrentImageLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ProductImages) {
        
        self.model = model
        let urlString = model.imageURL
        let url = URL(string: urlString)
        productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
    }
    
}

// MARK: - Private methods
private extension ProductViewCell {
    
    func setupUI() {
        
        contentView.backgroundColor = AppDesign.Color.white.ui
        contentView.fill(view: productImageView)
        productImageView.contentMode = .scaleAspectFill
    }
    
}
