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
    var controller: CollectionViewController? {
        didSet {
            collectionView.delegate = controller
            collectionView.dataSource = controller
        }
    }
    
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    // Наверное нужно написать делегат
    // так как мы нигде не сеттим делегат при вызовеHeaderView внутри контроллера
    
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
        collectionView.backgroundColor = .systemIndigo // collection view появляется но почему то не грузятся фотки
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor), // констрейнты работают
                                     collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}


