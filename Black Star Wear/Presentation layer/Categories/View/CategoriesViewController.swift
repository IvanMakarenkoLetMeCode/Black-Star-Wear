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
    //..
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - CategoriesViewInput
extension CategoriesViewController: CategoriesViewInput {}

// MARK: Private methods
private extension CategoriesViewController {
    
    func setupUI() {}
    
}
