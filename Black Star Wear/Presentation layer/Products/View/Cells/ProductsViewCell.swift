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
        priceLabel.text = priceFormate(model.price)
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
        titleLabel.numberOfLines = 2
        titleLabel.font = AppDesign.Font.regular.with(size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui

        productImageView.contentMode = .scaleToFill
        productImageView.widthAnchor.constraint(equalToConstant: 168).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 168).isActive = true

        priceLabel.contentMode = .left
        priceLabel.numberOfLines = 1
        priceLabel.font = AppDesign.Font.regular.with(size: 16)
        priceLabel.textColor = AppDesign.Color.title.ui

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(productImageView)
        contentStackView.addArrangedSubview(priceLabel)
    }
    
    func priceFormate(_ price: String) -> String {
        
        var formatedPrice = price
        let priceNumber = NumberFormatter().number(from: formatedPrice)
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        formater.locale = Locale(identifier: "ru_RU")
        formatedPrice = formater.string(from: priceNumber ?? 0) ?? ""
        return formatedPrice
        
    }
    
}
