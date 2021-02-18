//
//  ProductsViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

class ProductsViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    private var contentStackView = UIStackView()
    private var titleLabel = UILabel()
    private var productImageView = URLImageView()
    private var priceStackView = UIStackView()
    private var priceLabel = UILabel()
    private let screenSize: CGRect = UIScreen.main.bounds
    private var model: ProductsCellData?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ProductsCellData) {
        
        self.model = model
        titleLabel.text = model.name
        priceLabel.text = model.price.priceFormate()
        if !model.mainImage.isEmpty {
            let urlString = "https://blackstarshop.ru/" + model.mainImage
            let url = URL(string: urlString)
            productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
        }
        else {
            let url = URL(string: model.mainImage)
            productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
        }
        
    }
    
}

// MARK: - Private methods
private extension ProductsViewCell {
    
    func setupUI() {
        
        contentView.backgroundColor = AppDesign.Color.white.ui
        contentView.fill(view: contentStackView)
        contentStackView.axis = .vertical
        contentStackView.alignment = .center
        contentStackView.spacing = 6

        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.widthAnchor.constraint(equalToConstant: ((screenSize.width / 2) - 32)).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: ((screenSize.width / 2) - 32)).isActive = true

        priceLabel.contentMode = .left
        priceLabel.numberOfLines = 1
        priceLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 16)
        priceLabel.textColor = AppDesign.Color.title.ui

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(productImageView)
        contentStackView.addArrangedSubview(priceLabel)
    }
    
}
