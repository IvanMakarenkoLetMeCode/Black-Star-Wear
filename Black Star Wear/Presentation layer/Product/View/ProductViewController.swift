//
//  ProductViewController.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: ProductViewOutput!
    
    // MARK: Bar data source
    //..
    
    // MARK: - Private properties
    
    private var collectionView: UICollectionView!
    private let productCellIdentifier = String(describing: ProductViewCell.self)
    private var backButton = VButton()
    private var cartButton = VButton()
    private var contentScrollView = UIScrollView()
    private var contentStackView = UIStackView()
    private var titleStackView = UIStackView()
    private var titleLabel = UILabel()
    private let separatorView = UIView()
    private var priceStackView = UIStackView()
    private var costLabel = UILabel()
    private var priceLabel = UILabel()
    private var addToCartButton = VButton()
    private var descriptionTextView = UITextView()
    private let screenSize: CGRect = UIScreen.main.bounds
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - ProductViewInput
extension ProductViewController: ProductViewInput {
    
    func setupContent() {
        
        titleLabel.text = output.chosedProduct.name
        priceLabel.text = output.chosedProduct.price.priceFormate()
        descriptionTextView.attributedText = output.chosedProduct.description
            .convertHTMLStringToAttributed(fontName: AppDesign.FontName.roboto.rawValue, fontSize: 16)
        if output.chosedProduct.productImages.isEmpty {
            
            backButton.backgroundColor = AppDesign.Color.grey.ui
            backButton.layer.cornerRadius = AppDesign.constants.smallCornerRadius
            cartButton.backgroundColor = AppDesign.Color.grey.ui
            cartButton.layer.cornerRadius = 5
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension ProductViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.chosedProduct.productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier,
                                                            for: indexPath) as? ProductViewCell else { fatalError() }
        let image = output.chosedProduct.productImages[indexPath.row]
        cell.configureCell(model: image)
        return cell
    }

}

// MARK: Private methods
private extension ProductViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        
        backButton.backgroundColor = .clear
        backButton.setImage(AppDesign.Icon.backButton.value)
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        backButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        cartButton.backgroundColor = .clear
        cartButton.setImage(AppDesign.Icon.cart.value)
        cartButton.clipsToBounds = true
        cartButton.addTarget(self, action: #selector(cartButtonDidTap), for: .touchUpInside)
        cartButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let width = view.frame.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: width)
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = AppDesign.Color.white.ui
        collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: productCellIdentifier)
        self.collectionView = collectionView
         
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 15
        
        titleStackView.axis = .vertical
        titleStackView.alignment = .fill
        titleStackView.spacing = 0
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = AppDesign.Font.bold.with(fontName: AppDesign.FontName.akzidenzGroteskPro.rawValue, size: 36)
        titleLabel.textColor = AppDesign.Color.title.ui
        
        separatorView.backgroundColor = AppDesign.Color.separator.ui
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: (screenSize.width - 32)).isActive = true
        
        let spaceView = UIView()
        spaceView.backgroundColor = AppDesign.Color.white.ui
        spaceView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        priceStackView.axis = .horizontal
        priceStackView.alignment = .fill
        priceStackView.distribution = .fill
        priceStackView.spacing = 5
        
        costLabel.text = "Стоимость:".localized()
        costLabel.textAlignment = .left
        costLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.roboto.rawValue, size: 18)
        costLabel.textColor = AppDesign.Color.title.ui
        
        priceLabel.textAlignment = .right
        priceLabel.font = AppDesign.Font.bold.with(fontName: AppDesign.FontName.roboto.rawValue, size: 18)
        priceLabel.textColor = AppDesign.Color.grey.ui
        
        addToCartButton.setTitle("ДОБАВИТЬ В КОРЗИНУ".localized())
        addToCartButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        addToCartButton.layer.cornerRadius = AppDesign.constants.cornerRadius
        addToCartButton.titleLabel?.font = AppDesign.Font.medium.with(fontName: AppDesign.FontName.roboto.rawValue,
                                                                      size: 18)
        addToCartButton.setTitleColor(AppDesign.Color.white.ui, for: .normal)
        addToCartButton.backgroundColor = AppDesign.Color.blue.ui
        addToCartButton.clipsToBounds = true
        addToCartButton.addTarget(self, action: #selector(addToCartButtonDidTap), for: .touchUpInside)
        
        descriptionTextView.textAlignment = .left
        descriptionTextView.textColor = AppDesign.Color.black.ui
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0.01, left: 0, bottom: 0.01, right: 0)
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.isEditable = false
        
        let emptyView = UIView()
        emptyView.backgroundColor = AppDesign.Color.white.ui
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(backButton)
        view.addSubview(cartButton)
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentStackView)
        setupViewConstraints()
        
        priceStackView.addArrangedSubview(costLabel)
        priceStackView.addArrangedSubview(priceLabel)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(separatorView)
        titleStackView.addArrangedSubview(spaceView)
        titleStackView.addArrangedSubview(priceStackView)
        contentStackView.addArrangedSubview(titleStackView)
        contentStackView.addArrangedSubview(addToCartButton)
        contentStackView.addArrangedSubview(descriptionTextView)
        contentStackView.addArrangedSubview(emptyView)
    }
    
    func setupViewConstraints() {
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: screenSize.width).isActive = true
        
        contentScrollView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8).isActive = true
        contentScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        contentScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            .isActive = true
        
        contentStackView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 0).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: 0).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: 0)
            .isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 0).isActive = true
        
        backButton.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 38).isActive = true
        backButton.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 16).isActive = true
        
        cartButton.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 38).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -16).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func addToCartButtonDidTap(sender: VButton) {
        
        output.addToCartButtonDidTap()
    }
    
    @objc func backButtonDidTap(sender: VButton) {
        
        output.backButtonDidTap()
    }
    
    @objc func cartButtonDidTap(sender: VButton) {
        
        output.cartButtonDidTap()
    }
    
}
