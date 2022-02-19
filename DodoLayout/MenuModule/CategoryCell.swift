//
//  CategoryCell.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    static let reuseIdentifier = "CategoryCell"
    
    // MARK: Properties
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                setupViewsWhenSelected()
            } else {
                setupViewsWhenDeselected()
            }
        }
    }
    
    var category: FoodKind!
    
    public var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsWhenDeselected()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Helpers
    private func setupViewsWhenDeselected() {
        backgroundColor = .systemGroupedBackground
        textLabel.textColor = UIColor.systemPink.withAlphaComponent(0.4)
        layer.cornerRadius = 18
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemPink.withAlphaComponent(0.4).cgColor
    }
    
    private func setupViewsWhenSelected() {
        backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
        textLabel.textColor = UIColor.systemPink
        layer.borderWidth = 0
        layer.cornerRadius = 18
    }
    
    private func setupConstraints() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}

