//
//  CategoriesPresenter.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

class CategoriesPresenter {
    
    // MARK: - Public properties
    
    weak var view: CategoriesViewInput?
    
    // MARK: CategoriesCoordinatorOutput
    //..
    
    // MARK: - Private properties
    //..
    
    // MARK: - Lifecycle
    //..
    
}

// MARK: - CategoriesCoordinatorInput
//..

// MARK: - CategoriesCoordinatorOutput
//..

// MARK: - EmailVerificationViewOutput
extension CategoriesPresenter: CategoriesViewOutput {
    
    func viewDidLoad() {
        
        setupInitialState()
    }
    
}

// MARK: - Private methods
private extension CategoriesPresenter {
    
    func setupInitialState() {
        
        // ..
    }
    
}
