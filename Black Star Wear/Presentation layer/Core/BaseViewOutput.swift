//
//  BaseViewOutput.swift
//  Black Star Wear
//
//  Created by Ivan on 12.02.2021.
//

import Foundation

protocol BaseViewOutput: class {

    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
}

extension BaseViewOutput {
    
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDisappear() {}
}
