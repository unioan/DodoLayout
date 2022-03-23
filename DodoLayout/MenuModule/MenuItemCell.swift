//
//  ItemCell.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

protocol MenuItemCellProtocol: AnyObject {
    func priceButtonTapped(menuItem: MenuItem)
    func updateCartBudge(menuItem: MenuItem)
}

final class MenuItemCell: UICollectionViewCell {
    static let reuseIdentifier = "ItemCell"
    
    // MARK: Properties
    public weak var delegate: MenuItemCellProtocol?
    public var foodKind: FoodKind!
    public var menuItem: MenuItem! {
        didSet{ configureWithData(menuItem: menuItem)
                setAppearence() }
    }
    
    
    public var ItemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 18
        iv.clipsToBounds = true
        return iv
    }()
    
    public var itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        label.isUserInteractionEnabled = false
        label.textAlignment = .left
        return label
    }()
    
    public var captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        
        label.isUserInteractionEnabled = false
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    public lazy var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        setDeselectedPriceButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func priceButtonTapped() {
        changeState()
        setAppearence()
        delegate?.priceButtonTapped(menuItem: menuItem)
        delegate?.updateCartBudge(menuItem: menuItem)
    }
    
    
    // MARK: State and Apearence
    func changeState() {
        switch menuItem.menuItemState {
        case .some:
            menuItem.menuItemState = .empty
        case .empty:
            menuItem.menuItemState = .some
        }
    }
        
    func setAppearence() {
        switch menuItem.menuItemState {
        case .some:
            priceButton.tintColor = .white
            priceButton.backgroundColor = .systemPink
        case .empty:
            priceButton.tintColor = .systemPink
            priceButton.backgroundColor = .white
        }
    }
        
        
        // MARK: Helpers
        private func configureWithData(menuItem: MenuItem) {
            foodKind = menuItem.foodKind
            ItemImageView.image = menuItem.image
            itemNameLabel.text = menuItem.itemName
            captionLabel.text = menuItem.caption
            priceButton.setAttributedTitle(.setPrice(menuItem.price), for: .normal)
        }
        
        private func setDeselectedPriceButton() {
            priceButton.titleLabel?.textColor = .systemPink
            priceButton.backgroundColor = .white
            priceButton.layer.cornerRadius = 7
            priceButton.layer.borderWidth = 2
            priceButton.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.4).cgColor
        }
        
        private func setupConstraints() {
            
            let nameAndCaptionStack = UIStackView(arrangedSubviews: [priceButton])
            addSubview(nameAndCaptionStack)
            nameAndCaptionStack.translatesAutoresizingMaskIntoConstraints = false
            nameAndCaptionStack.axis = .vertical
            nameAndCaptionStack.distribution = .fillEqually
            nameAndCaptionStack.alignment = .trailing
            
            
            let descriptionItemsStack = UIStackView(arrangedSubviews: [itemNameLabel, captionLabel, nameAndCaptionStack])
            addSubview(descriptionItemsStack)
            descriptionItemsStack.translatesAutoresizingMaskIntoConstraints = false
            descriptionItemsStack.axis = .vertical
            descriptionItemsStack.alignment = .leading
            descriptionItemsStack.distribution = .fillProportionally
            descriptionItemsStack.spacing = 10
            
            
            let mainStack = UIStackView(arrangedSubviews: [ItemImageView, descriptionItemsStack])
            addSubview(mainStack)
            mainStack.translatesAutoresizingMaskIntoConstraints = false
            mainStack.axis = .horizontal
            mainStack.alignment = .top
            mainStack.distribution = .fill
            mainStack.spacing = 8
            
            NSLayoutConstraint.activate([
                mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
                mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
                mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            ])
            
            NSLayoutConstraint.activate([
                ItemImageView.heightAnchor.constraint(equalToConstant: 130),
                ItemImageView.widthAnchor.constraint(equalToConstant: 130),
            ])
            
            NSLayoutConstraint.activate([
                priceButton.heightAnchor.constraint(equalToConstant: 28),
                priceButton.widthAnchor.constraint(equalToConstant: 68),
                priceButton.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor)
            ])
        }
    }
