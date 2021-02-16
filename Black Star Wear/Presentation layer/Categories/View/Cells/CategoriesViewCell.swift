//
//  CategoriesViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import UIKit

class CategoriesViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var contentStackView = UIStackView()
    private var iconImageView = UIImageView()
    private var titleLabel = UILabel()
    private var emptyView = UIView()
    private var model: CategoryCellData = CategoryCellDataProducer(name: "",
                                                 sortOrder: "",
                                                 image: "",
                                                 iconImage: "",
                                                 iconImageActive: "",
                                                 subcategories: [])
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: CategoryCellData) {
        self.model = model
        titleLabel.text = model.name
    }
    
}

// MARK: - Private methods
private extension CategoriesViewCell {
    
    func setupUI() {
        
        contentView.fill(view: contentStackView, insets: .init(top: 32, left: 16, bottom: 32, right: 16))
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.spacing = 16
        
//        https://blackstarshop.ru/image/catalog/im2017/1.png
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        titleLabel.contentMode = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = AppDesign.Font.regular.with(size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        emptyView.widthAnchor.constraint(equalToConstant: 23).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(emptyView)
    }
    
}