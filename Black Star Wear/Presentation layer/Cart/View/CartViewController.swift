//
//  CartViewController.swift
//  Black Star Wear
//
//  Created by Ivan on 19.02.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: CartViewOutput!
    
    // MARK: Bar data source
    //..
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private let cartCellIdentifier = String(describing: CartViewCell.self)
    private var contentStackView = UIStackView()
    private var priceStackView = UIStackView()
    private var costLabel = UILabel()
    private var priceLabel = UILabel()
    private var buttonStackView = UIStackView()
    private var checkoutButton = VButton()
    private var onMainButton = VButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        output.viewDidLoad()
    }
    
}

// MARK: - CategoriesViewInput
extension CartViewController: CartViewInput {
    
    func tableViewReloadData() {
        
        tableView.reloadData()
    }
    
    func setupContent() {
        
        var priceInt: [Int] = []
        for cell in output.cells {
            priceInt.append(Int(removeCharacterAfterDot(string: cell.price)) ?? 0)
        }
        
        let priceSummary = priceInt.map{$0}.reduce(0, +)
        if priceSummary > 0 {

            let priceString = String(priceSummary)
            priceLabel.text = priceString.priceFormate()
            onMainButton.isHidden = true
        }
        else {

            priceLabel.text = "0".priceFormate()
            checkoutButton.isHidden = true
        }
        
    }
    
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cartCellIdentifier, for: indexPath) as? CartViewCell else { fatalError() }
        let product = output.cells[indexPath.row]
        cell.configureCell(model: product)
        return cell
    }

}

// MARK: Private methods
private extension CartViewController {
    
    func setupUI() {
        
        view.backgroundColor = AppDesign.Color.white.ui
        
        tableView.dataSource = self
        tableView.register(CartViewCell.self, forCellReuseIdentifier: cartCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 0
        
        let emptyView = UIView()
        
        priceStackView.axis = .horizontal
        priceStackView.alignment = .center
        priceStackView.spacing = 0
        priceStackView.layoutMargins = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        priceStackView.isLayoutMarginsRelativeArrangement = true
        
        costLabel.text = "Итого:".localized()
        costLabel.textAlignment = .left
        costLabel.font = AppDesign.Font.regular.with(fontName: AppDesign.FontName.roboto.rawValue, size: 18)
        costLabel.textColor = AppDesign.Color.title.ui
        
        priceLabel.textAlignment = .right
        priceLabel.font = AppDesign.Font.bold.with(fontName: AppDesign.FontName.roboto.rawValue, size: 18)
        priceLabel.textColor = AppDesign.Color.grey.ui
        
        let separatorView = UIView()
        separatorView.backgroundColor = AppDesign.Color.separator.ui
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 0
        
        checkoutButton.setTitle("Оформить заказ".localized())
        checkoutButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
        checkoutButton.layer.cornerRadius = AppDesign.constants.largeCornerRadius
        checkoutButton.titleLabel?.font = AppDesign.Font.medium.with(fontName: AppDesign.FontName.roboto.rawValue,
                                                                      size: 18)
        checkoutButton.setTitleColor(AppDesign.Color.white.ui, for: .normal)
        checkoutButton.backgroundColor = AppDesign.Color.blue.ui
        checkoutButton.clipsToBounds = true
        checkoutButton.addTarget(self, action: #selector(checkoutButtonDidTap), for: .touchUpInside)
        
        onMainButton.setTitle("На главную".localized())
        onMainButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
        onMainButton.layer.cornerRadius = AppDesign.constants.largeCornerRadius
        onMainButton.titleLabel?.font = AppDesign.Font.medium.with(fontName: AppDesign.FontName.roboto.rawValue,
                                                                      size: 18)
        onMainButton.setTitleColor(AppDesign.Color.white.ui, for: .normal)
        onMainButton.backgroundColor = AppDesign.Color.blue.ui
        onMainButton.clipsToBounds = true
        onMainButton.addTarget(self, action: #selector(onMainButtonDidTap), for: .touchUpInside)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(contentStackView)
        view.addSubview(buttonStackView)
        
        contentStackView.addArrangedSubview(emptyView)
        contentStackView.addArrangedSubview(priceStackView)
        contentStackView.addArrangedSubview(separatorView)
        
        priceStackView.addArrangedSubview(costLabel)
        priceStackView.addArrangedSubview(priceLabel)
        
        buttonStackView.addArrangedSubview(checkoutButton)
        buttonStackView.addArrangedSubview(onMainButton)
        setupViewConstraints()
        
        let crossButtonItem = UIBarButtonItem(image: AppDesign.Icon.cross.value, style: .plain, target: self, action: #selector(crossButtonDidTap))
        self.navigationItem.leftBarButtonItem = crossButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = AppDesign.Color.grey.ui
    }
    
    func setupViewConstraints() {
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        contentStackView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        buttonStackView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 36).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -47)
            .isActive = true
    }
    
    func removeCharacterAfterDot(string: String) -> String {
        
        var removeString = string
        if let dotRange = removeString.range(of: ".") {
            
            removeString.removeSubrange(dotRange.lowerBound ..< removeString.endIndex)
            return removeString
        }
        else {
            return ""
        }
    }
    
    // MARK: - Actions
    
    @objc func crossButtonDidTap(_ sender: Any) {
        
        output.crossButtonDidTap()
    }
    
    @objc func checkoutButtonDidTap(sender: VButton) {
        
        output.checkoutButtonDidTap()
    }
    
    @objc func onMainButtonDidTap(sender: VButton) {
        
        output.onMainButtonDidTap()
    }
    
}
