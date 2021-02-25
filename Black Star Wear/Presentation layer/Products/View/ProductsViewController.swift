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
        let width = (view.frame.width / 2) - 16
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: 230)
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = AppDesign.Color.white.ui
        collectionView.register(ProductsViewCell.self, forCellWithReuseIdentifier: productsCellIdentifier)
        self.collectionView = collectionView
        view.fill(view: self.collectionView, insets: .init(top: 20, left: 16, bottom: 12, right: 16))
        
        let cartButtonItem = UIBarButtonItem(image: AppDesign.Icon.cart.value, style: .plain, target: self,
                                             action: #selector(cartButtonDidTap))
        let backButtonItem = UIBarButtonItem(image: AppDesign.Icon.backButton.value, style: .plain, target: self,
                                             action: #selector(backButtonDidTap))
        self.navigationItem.rightBarButtonItem  = cartButtonItem
        self.navigationItem.leftBarButtonItem = backButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = AppDesign.Color.grey.ui
        self.navigationItem.rightBarButtonItem?.tintColor = AppDesign.Color.grey.ui
    }
    
    // MARK: - Actions
    
    @objc func cartButtonDidTap(_ sender: Any) {
        
        output.cartButtonDidTap()
    }
    
    @objc func backButtonDidTap(_ sender: Any) {
        
        output.backButtonDidTap()
    }
    
}
