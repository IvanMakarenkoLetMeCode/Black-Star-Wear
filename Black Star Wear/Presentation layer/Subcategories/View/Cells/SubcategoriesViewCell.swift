//
//  SubcategoriesViewCell.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit

class SubcategoriesViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var contentStackView = UIStackView()
    private var iconImageView = URLImageView()
    private var titleLabel = UILabel()
    private var emptyView = UIView()
    private var model: SubcategoryCellData?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    override func prepareForReuse() {
        
        iconImageView.sd_cancelCurrentImageLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: SubcategoryCellData) {
        
        self.model = model
        titleLabel.text = model.name
        let urlString = model.iconImage
        let url = URL(string: urlString)
        iconImageView.setImage(with: url, placeholderImage: AppDesign.Icon.categoryPlaceholder.value)
    }
    
}

// MARK: - Private methods
private extension SubcategoriesViewCell {
    
    func setupUI() {
        
        contentView.fill(view: contentStackView, insets: .init(top: 12, left: 16, bottom: 12, right: 16))
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.spacing = 16
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        iconImageView.layer.cornerRadius = 28
        iconImageView.layer.masksToBounds = true
        
        titleLabel.contentMode = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = AppDesign.FontName.sfProDisplay.regularWith(size: 16)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        emptyView.widthAnchor.constraint(equalToConstant: 23).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(emptyView)
    }
    
}
