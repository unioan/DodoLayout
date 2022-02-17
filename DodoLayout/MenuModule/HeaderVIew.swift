//
//  HeaderVIew.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "headerView"
    
    // MARK: Properties
    var categoriesCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: LayoutManger.createCategoryControllerCollectionLayout())
    
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: Helpers
    private func setupConstraints() {
    
        addSubview(categoriesCollectionView)
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.backgroundColor = .systemGroupedBackground
        NSLayoutConstraint.activate([categoriesCollectionView.topAnchor.constraint(equalTo: topAnchor),
                                     categoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     categoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     categoriesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}



// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: NumberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // MARK: CellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        cell.textLabel.text = ("\(indexPath.row)")
        cell.backgroundColor = .systemRed
        return cell
    }
    
    // MARK: ItemSelected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: TAPPED in Header view \(indexPath.row) cell!")
    }
    
    
}
