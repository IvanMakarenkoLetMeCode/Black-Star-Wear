//
//  CartViewInput.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import Foundation

protocol CartViewInput: BaseViewInput {
    
    func tableViewReloadData()
    func performBatchUpdates(deleteIndex: [IndexPath])
    func setupContent()
}
