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
        let product = output.cells[indexPath.row]
        cell.configureCell(model: product)
        return cell
    }

}

// MARK: Private methods
private extension ProductsViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        let width = (view.frame.width / 2) - 24
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: 230)
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.backgroundColor = AppDesign.Color.white.ui
        collectionView.register(ProductsViewCell.self, forCellWithReuseIdentifier: productsCellIdentifier)
        self.collectionView = collectionView
        view.fill(view: self.collectionView, insets: .init(top: 20, left: 16, bottom: 12, right: 16))
    }
    
}
