//
//  HeaderVIew.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "headerView"
    
    var collectionView: UICollectionView = CategoriesCollectionView()
    
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
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
        setupLabelConstraints()
    }
    
    private func setupLabelConstraints() {
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemRed
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}

