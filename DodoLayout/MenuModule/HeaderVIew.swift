//
//  HeaderVIew.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func categoryChosen(_ foodKind: FoodKind)
}



class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "headerView"
    
    // MARK: Properties
    weak var headerDelegate: HeaderViewDelegate?
    
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
        return FoodKind.allCases.count
    }
    
    // MARK: CellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        guard let foodCategory = FoodKind(rawValue: indexPath.row) else { fatalError()}
        cell.textLabel.text = ("\(foodCategory.foodString)")
        cell.backgroundColor = .systemRed
        return cell
    }
    
    // MARK: ItemSelected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let foodCategory = FoodKind(rawValue: indexPath.row) else { fatalError() }
        headerDelegate?.categoryChosen(foodCategory)
        //print("DEBUG: TAPPED in Header view \(foodCategory) cell index \(indexPath.row)!")
    }
    
    
}
