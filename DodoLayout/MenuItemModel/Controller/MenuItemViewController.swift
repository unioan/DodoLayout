//
//  MenuItemView.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.03.2022.
//

import UIKit

final class MenuItemViewController: UIViewController {
    
    // MARK: Properties
    var presenter: MenuItemPresenter!
    
    public var ItemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    public var itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        label.isUserInteractionEnabled = false
        label.textAlignment = .left
        return label
    }()
    
    public var captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.isUserInteractionEnabled = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemPink
        button.titleLabel?.textColor = .systemPink
        button.backgroundColor = .white
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.4).cgColor
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black // Sets backButton tintColor
        
        setConstrains()
        configureWithData(menuItem: presenter.menuItem)
    }
    
    
    // MARK: State
    func setSomeState() {
        presenter.menuItem.menuItemState = .some
    }
    
    func updateState() {
        guard let state = presenter.menuItem.menuItemState else { return }
        switch state {
        case .some:
            priceButton.tintColor = .white
            priceButton.backgroundColor = .systemPink
        case .empty:
            print("DEBUG: Hasn't set yet")
        }
    }
    
    
    // MARK: Actions
    @objc func priceButtonTapped() {
        setSomeState()
        updateState()
    }
    
    
    // MARK: Helpers
    func configureWithData(menuItem: MenuItem) {
        ItemImageView.image = menuItem.image
        itemNameLabel.text = menuItem.itemName
        captionLabel.text = menuItem.caption
        priceButton.setAttributedTitle(.setPriceForMenuItem(menuItem.price), for: .normal)
    }
    
    func setConstrains() {
        view.addSubview(ItemImageView)
        ItemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ItemImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     ItemImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     ItemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     ItemImageView.heightAnchor.constraint(equalToConstant: 300)])
        
        view.addSubview(itemNameLabel)
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([itemNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                     itemNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                                     itemNameLabel.topAnchor.constraint(equalTo: ItemImageView.bottomAnchor, constant: 22)])
        
        view.addSubview(captionLabel)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([captionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                     captionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                                     captionLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 8)])
        
        view.addSubview(priceButton)
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([priceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                                     priceButton.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 16),
                                     priceButton.widthAnchor.constraint(equalToConstant: 100),
                                     priceButton.heightAnchor.constraint(equalToConstant: 40)])
        
    }
    
}


extension MenuItemViewController :MenuItemViewProtocol {}
