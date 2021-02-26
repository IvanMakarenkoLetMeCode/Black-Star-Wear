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
    private var cartButton = VButton()
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
