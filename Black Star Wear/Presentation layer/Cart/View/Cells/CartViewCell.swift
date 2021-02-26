//
//  CartViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import UIKit

protocol CartViewCellDelegate: AnyObject {
    
    func deleteButtonDidTap(_ cell: UITableViewCell)
}

class CartViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var productImageView = URLImageView()
    private var contentStackView = UIStackView()
    private var mainStackView = UIStackView()
    private var titleLabel = UILabel()
    private var sizeLabel = UILabel()
    private var colorLabel = UILabel()
    private var priceLabel = UILabel()
    private var deleteButton = VButton()
    private var model: CartCellData?
    private weak var delegate: CartViewCellDelegate?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    override func prepareForReuse() {
        
        productImageView.sd_cancelCurrentImageLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: CartCellData, delegate: CartViewCellDelegate?) {
        
        self.model = model
        self.delegate = delegate
        titleLabel.text = model.name
        let size = model.offers.first?.size ?? ""
        sizeLabel.text = "Размер: ".localized() + size
        colorLabel.text = "Цвет: ".localized() + model.colorName
        let priceString = String(model.price)
        priceLabel.text = priceString.priceFormate()
        let urlString = model.mainImage
        let url = URL(string: urlString)
        productImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
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
        contentStackView.alignment = .center
        contentStackView.spacing = 10
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 5
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        sizeLabel.textAlignment = .left
        sizeLabel.numberOfLines = 1
        sizeLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        sizeLabel.textColor = AppDesign.Color.grey.ui
        
        colorLabel.textAlignment = .left
        colorLabel.numberOfLines = 1
        colorLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        colorLabel.textColor = AppDesign.Color.grey.ui
        
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 1
        priceLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 15)
        priceLabel.textColor = AppDesign.Color.title.ui
        
        deleteButton.backgroundColor = .clear
        deleteButton.setImage(AppDesign.Icon.bin.value)
        deleteButton.clipsToBounds = true
        deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        deleteButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        contentView.fill(view: contentStackView, insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentStackView.addArrangedSubview(productImageView)
        contentStackView.addArrangedSubview(mainStackView)
        contentStackView.addArrangedSubview(deleteButton)
        contentStackView.setCustomSpacing(10, after: deleteButton)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(sizeLabel)
        mainStackView.addArrangedSubview(colorLabel)
        mainStackView.addArrangedSubview(priceLabel)
    }
    
    // MARK: - Actions
    
    @objc func deleteButtonDidTap(sender: VButton) {
        
        delegate?.deleteButtonDidTap(self)
    }
    
}
