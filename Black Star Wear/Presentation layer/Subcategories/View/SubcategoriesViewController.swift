//
//  SubcategoriesViewController.swift
//  Black Star Wear
//
//  Created by Ivan on 16.02.2021.
//

import UIKit

class SubcategoriesViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: SubcategoriesViewOutput!
    
    // MARK: Bar data source
    //..
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private var cartButtonItem = UIBarButtonItem()
    private let subcategoriesCellIdentifier = String(describing: SubcategoriesViewCell.self)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - SubcategoriesViewInput
extension SubcategoriesViewController: SubcategoriesViewInput {
    
    func tableViewReloadData() {
        
        tableView.reloadData()
    }
    
    func cartNotEmpty(color: UIColor, image: UIImage?, title: String?) {
        
        cartButtonItem.title = title
        cartButtonItem.image = image
        cartButtonItem.tintColor = color
    }
    
}

// MARK: - UITableViewDataSource
extension SubcategoriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: subcategoriesCellIdentifier, for: indexPath) as? SubcategoriesViewCell else { fatalError() }
        let subcategory = output.cells[indexPath.row]
        cell.configureCell(model: subcategory)
        return cell
    }

}

// MARK: - UITableViewDelegate
extension SubcategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        output.onProducts(id: output.cells[indexPath.row].id)
    }
    
}

// MARK: Private methods
private extension SubcategoriesViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        view.fill(view: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SubcategoriesViewCell.self, forCellReuseIdentifier: subcategoriesCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        
        cartButtonItem = UIBarButtonItem(image: AppDesign.Icon.cart.value, style: .plain, target: self,
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
