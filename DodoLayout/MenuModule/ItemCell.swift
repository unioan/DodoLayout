//
//  ItemCell.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class ItemCell: UICollectionViewCell {
    static let reuseIdentifier = "ItemCell"
    
    public var ItemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "pizza1")
        iv.layer.cornerRadius = 18
        iv.clipsToBounds = true
        return iv
    }()
    
    public var itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Pottato Pizza"
        
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        return label
    }()
    
    public var captionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor."
        
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(.setPrice(756), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        textLabelConstraints()
        setDeselectedPriceButton()
    }
    
    private func setDeselectedPriceButton() {
        priceButton.titleLabel?.textColor = .systemPink
        priceButton.backgroundColor = .white
        priceButton.layer.cornerRadius = 7
        priceButton.layer.borderWidth = 2
        priceButton.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.4).cgColor
    }
    
    private func textLabelConstraints() {
        
        addSubview(priceButton)
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceButton.heightAnchor.constraint(equalToConstant: 30),
            priceButton.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        let nameAndCaptionStack = UIStackView(arrangedSubviews: [itemNameLabel, captionLabel])
        addSubview(nameAndCaptionStack)
        nameAndCaptionStack.translatesAutoresizingMaskIntoConstraints = false
        nameAndCaptionStack.axis = .vertical
        nameAndCaptionStack.distribution = .fill
        nameAndCaptionStack.spacing = 5
    
        
        let descriptionItemsStack = UIStackView(arrangedSubviews: [nameAndCaptionStack, priceButton])
        addSubview(descriptionItemsStack)
        descriptionItemsStack.translatesAutoresizingMaskIntoConstraints = false
        descriptionItemsStack.axis = .vertical
        descriptionItemsStack.alignment = .trailing
        descriptionItemsStack.distribution = .fill
        descriptionItemsStack.spacing = 12
        
        
        let mainStack = UIStackView(arrangedSubviews: [ItemImageView, descriptionItemsStack])
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .horizontal
        mainStack.alignment = .center
        mainStack.distribution = .fill
        mainStack.spacing = 8
      
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
        ])
        
        NSLayoutConstraint.activate([
            ItemImageView.heightAnchor.constraint(equalToConstant: 140),
            ItemImageView.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
}
