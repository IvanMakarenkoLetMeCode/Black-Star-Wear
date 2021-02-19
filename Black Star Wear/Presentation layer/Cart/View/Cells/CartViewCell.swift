//
//  CartViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import UIKit

class CartViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var productImageView = URLImageView()
    private var contentStackView = UIStackView()
    private var mainStackView = UIStackView()
    private var titleLabel = UILabel()
    private var sizeStackView = UIStackView()
    private var colorStackView = UIStackView()
    private var titleSizeLabel = UILabel()
    private var sizeLabel = UILabel()
    private var tittleColorLabel = UILabel()
    private var colorLabel = UILabel()
    private var priceLabel = UILabel()
    private var deleteButton = VButton()
    private var model: ProductsCellData?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: ProductsCellData) {
        
        self.model = model
        titleLabel.text = model.name
        sizeLabel.text = model.offers.first?.size
        colorLabel.text = model.colorName
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
private extension CartViewCell {
    
    func setupUI() {
        
        contentView.backgroundColor = AppDesign.Color.white.ui
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        contentStackView.axis = .horizontal
        contentStackView.alignment = .fill
        contentStackView.spacing = 0
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 5
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        sizeStackView.axis = .horizontal
        sizeStackView.alignment = .leading
        sizeStackView.spacing = 0
        
        titleSizeLabel.text = "Размер: ".localized()
        titleSizeLabel.textAlignment = .left
        titleSizeLabel.numberOfLines = 1
        titleSizeLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 11)
        titleSizeLabel.textColor = AppDesign.Color.grey.ui
        
        sizeLabel.textAlignment = .left
        sizeLabel.numberOfLines = 1
        sizeLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 11)
        sizeLabel.textColor = AppDesign.Color.grey.ui
        
        let emptySizeView = UIView()
        
        colorStackView.axis = .horizontal
        colorStackView.alignment = .leading
        colorStackView.spacing = 0
        
        tittleColorLabel.text = "Цвет: ".localized()
        tittleColorLabel.textAlignment = .left
        tittleColorLabel.numberOfLines = 1
        tittleColorLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 11)
        tittleColorLabel.textColor = AppDesign.Color.grey.ui
        
        colorLabel.textAlignment = .left
        colorLabel.numberOfLines = 1
        colorLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 11)
        colorLabel.textColor = AppDesign.Color.grey.ui
        
        let emptyView = UIView()
        
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 1
        priceLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.sfProDisplay.rawValue, size: 15)
        priceLabel.textColor = AppDesign.Color.title.ui
        
        let spaceView = UIView()
        
        deleteButton.backgroundColor = .clear
        deleteButton.setImage(AppDesign.Icon.bin.value)
        deleteButton.clipsToBounds = true
        deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        deleteButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImageView)
        contentView.addSubview(contentStackView)
        contentView.addSubview(deleteButton)
        
        contentStackView.addArrangedSubview(mainStackView)
        contentStackView.addArrangedSubview(spaceView)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(sizeStackView)
        mainStackView.addArrangedSubview(colorStackView)
        mainStackView.addArrangedSubview(emptyView)
        mainStackView.addArrangedSubview(priceLabel)
        
        sizeStackView.addArrangedSubview(titleSizeLabel)
        sizeStackView.addArrangedSubview(sizeLabel)
        sizeStackView.addArrangedSubview(emptySizeView)
        
        colorStackView.addArrangedSubview(tittleColorLabel)
        colorStackView.addArrangedSubview(colorLabel)
        setupViewConstraints()
    }
    
    func setupViewConstraints() {
        
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        deleteButton.leadingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: 10).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func deleteButtonDidTap(sender: VButton) {
        
        //..
    }
    
}
