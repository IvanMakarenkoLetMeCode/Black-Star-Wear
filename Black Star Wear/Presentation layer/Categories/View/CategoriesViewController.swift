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
    
}

// MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath) as? CategoriesViewCell else { fatalError() }
//        let cell = tableView.dequeueReusableCell(withIdentifier: categoriesCellIdentifier, for: indexPath)
        let category = output.cells[indexPath.row]
        cell.configureCell(model: category)
        return cell
    }
    
}

// MARK: Private methods
private extension CategoriesViewController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        view.fill(view: tableView)
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: categoriesCellIdentifier)
//        tableView.register(UINib(nibName: categoriesCellIdentifier, bundle: nil),
//                           forCellReuseIdentifier: categoriesCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
//        tableView.contentInset.top = 10
//        tableView.contentInset.bottom = 10
    }
    
}
