//
//  CategoriesViewController.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: CategoriesViewOutput!
    
    // MARK: Bar data source
    //..
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private var cartButton = VButton()
    private let categoriesCellIdentifier = String(describing: CategoriesViewCell.self)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - CategoriesViewInput
extension CategoriesViewController: CategoriesViewInput {
    
    func tableViewReloadData() {
        
        tableView.reloadData()
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

// MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath) as? CategoriesViewCell else { fatalError() }
        let category = output.cells[indexPath.row]
        cell.configureCell(model: category)
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
            
        if output.cells[indexPath.row].subcategories.isEmpty {
            
            output.onProducts(id: output.cells[indexPath.row].id)
        }
        else {
            
            output.onSubcategories(id: output.cells[indexPath.row].id)
        }
        
    }
    
}

// MARK: Private methods
private extension CategoriesViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        view.fill(view: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: categoriesCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        
        cartButton.backgroundColor = AppDesign.Color.clear.ui
        cartButton.setImage(AppDesign.Icon.cart.value)
        cartButton.clipsToBounds = true
        cartButton.addTarget(self, action: #selector(cartButtonDidTap), for: .touchUpInside)
        cartButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let rightBarButton = UIBarButtonItem(customView: cartButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
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
    
}
