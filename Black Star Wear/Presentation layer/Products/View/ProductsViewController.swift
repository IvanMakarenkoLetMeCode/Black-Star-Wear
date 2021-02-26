//
//  ProductsViewController.swift
//  Black Star Wear
//
//  Created by Ivan on 17.02.2021.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: ProductsViewOutput!
    
    // MARK: Bar data source
    //..
    
    // MARK: - Private properties
    
    private var collectionView: UICollectionView!
    private var cartButton = VButton()
    private let productsCellIdentifier = String(describing: ProductsViewCell.self)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - ProductsViewInput
extension ProductsViewController: ProductsViewInput {
    
    func collectionViewReloadData() {
        
        collectionView.reloadData()
    }
    
    func setupCartButton(count: Int) {
        
        if count == 0 {
            
            setupCartButtonUI(color: AppDesign.Color.clear.ui,
                              image: AppDesign.Icon.cart.value,
                              cornerRadius: 0,
                              title: nil,
                              textSize: nil)
        }
        else if count > 0 && count < 100 {
            
            setupCartButtonUI(color: AppDesign.Color.red.ui,
                              image: nil,
                              cornerRadius: 10,
                              title: String(count),
                              textSize: 12)
        }
        else {
            
            setupCartButtonUI(color: AppDesign.Color.red.ui,
                              image: nil,
                              cornerRadius: 10,
                              title: "..",
                              textSize: 16)
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productsCellIdentifier,
                                                            for: indexPath) as? ProductsViewCell else { fatalError() }
        let product = output.cells[indexPath.item]
        cell.configureCell(model: product)
        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension ProductsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        output.onProduct(id: output.cells[indexPath.row].id)
    }
    
}

// MARK: Private methods
private extension ProductsViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        let width = (view.frame.width / 2) - 24
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: (width + 51))
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = AppDesign.Color.white.ui
        collectionView.register(ProductsViewCell.self, forCellWithReuseIdentifier: productsCellIdentifier)
        self.collectionView = collectionView
        view.fill(view: self.collectionView, insets: .init(top: 20, left: 16, bottom: 12, right: 16))
        
        cartButton.backgroundColor = AppDesign.Color.clear.ui
        cartButton.setImage(AppDesign.Icon.cart.value)
        cartButton.clipsToBounds = true
        cartButton.addTarget(self, action: #selector(cartButtonDidTap), for: .touchUpInside)
        cartButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let backButtonItem = UIBarButtonItem(image: AppDesign.Icon.backButton.value, style: .plain, target: self,
                                             action: #selector(backButtonDidTap))
        let rightBarButton = UIBarButtonItem(customView: cartButton)
        self.navigationItem.rightBarButtonItem  = rightBarButton
        self.navigationItem.leftBarButtonItem = backButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = AppDesign.Color.grey.ui
        self.navigationController?.navigationBar.backgroundColor = AppDesign.Color.navigationBar.ui
    }
    
    func setupCartButtonUI(color: UIColor, image: UIImage?, cornerRadius: CGFloat, title: String?, textSize: CGFloat?) {
        
        cartButton.backgroundColor = color
        cartButton.setImage(image)
        cartButton.layer.cornerRadius = cornerRadius
        cartButton.setTitle(title)
        if let textSize = textSize {
            cartButton.titleLabel?.font = AppDesign.FontName.roboto.mediumWith(size: textSize)
        }
        
    }
    
    // MARK: - Actions
    
    @objc func cartButtonDidTap(_ sender: Any) {
        
        output.cartButtonDidTap()
    }
    
    @objc func backButtonDidTap(_ sender: Any) {
        
        output.backButtonDidTap()
    }
    
}
