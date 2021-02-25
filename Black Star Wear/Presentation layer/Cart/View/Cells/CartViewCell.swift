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
    private var sizeStackView = UIStackView()
    private var colorStackView = UIStackView()
    private var titleSizeLabel = UILabel()
    private var sizeLabel = UILabel()
    private var tittleColorLabel = UILabel()
    private var colorLabel = UILabel()
    private var priceLabel = UILabel()
    private var deleteButton = VButton()
    private var model: ProductsCellData?
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
    
    func configureCell(model: ProductsCellData, delegate: CartViewCellDelegate?) {
        
        self.model = model
        self.delegate = delegate
        titleLabel.text = model.name
        sizeLabel.text = model.offers.first?.size
        colorLabel.text = model.colorName
        let priceString = String(model.price)
        priceLabel.text = priceString.priceFormate()
        let urlString = "https://blackstarshop.ru/" + model.mainImage
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
        
        sizeStackView.axis = .horizontal
        sizeStackView.alignment = .leading
        sizeStackView.spacing = 0
        
        titleSizeLabel.text = "Размер: ".localized()
        titleSizeLabel.textAlignment = .left
        titleSizeLabel.numberOfLines = 1
        titleSizeLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        titleSizeLabel.textColor = AppDesign.Color.grey.ui
        
        sizeLabel.textAlignment = .left
        sizeLabel.numberOfLines = 1
        sizeLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        sizeLabel.textColor = AppDesign.Color.grey.ui
        
        colorStackView.axis = .horizontal
        colorStackView.alignment = .leading
        colorStackView.spacing = 0
        
        tittleColorLabel.text = "Цвет: ".localized()
        tittleColorLabel.textAlignment = .left
        tittleColorLabel.numberOfLines = 1
        tittleColorLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        tittleColorLabel.textColor = AppDesign.Color.grey.ui
        
        colorLabel.textAlignment = .left
        colorLabel.numberOfLines = 1
        colorLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 11)
        colorLabel.textColor = AppDesign.Color.grey.ui
        
        let emptyView = UIView()
        let spaceView = UIView()
        
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
        mainStackView.addArrangedSubview(sizeStackView)
        mainStackView.addArrangedSubview(colorStackView)
        mainStackView.addArrangedSubview(priceLabel)
        
        sizeStackView.addArrangedSubview(titleSizeLabel)
        sizeStackView.addArrangedSubview(sizeLabel)
        sizeStackView.addArrangedSubview(emptyView)
        
        colorStackView.addArrangedSubview(tittleColorLabel)
        colorStackView.addArrangedSubview(colorLabel)
        colorStackView.addArrangedSubview(spaceView)
    }
    
    // MARK: - Actions
    
    @objc func deleteButtonDidTap(sender: VButton) {
        
        delegate?.deleteButtonDidTap(self)
    }
    
}
