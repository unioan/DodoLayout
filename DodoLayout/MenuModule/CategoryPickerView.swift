//
//  HeaderVIew.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

protocol CategoryPickerViewDelegate: AnyObject {
    func categoryChosen(_ foodKind: FoodKind)
}


final class CategoryPickerView: UICollectionReusableView {
    static let reuseIdentifier = "headerView"
    
    // MARK: Properties
    weak var headerDelegate: CategoryPickerViewDelegate?
    
    var categoriesCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: LayoutManger.createCategoryControllerCollectionLayout())
    
    var initialySelectedButton = true
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
extension CategoryPickerView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: NumberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodKind.allCases.count
    }
    
    // MARK: CellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        guard let foodCategory = FoodKind(rawValue: indexPath.row) else { fatalError()}
        
        cell.category = foodCategory
        cell.textLabel.text = ("\(foodCategory.foodString)")
        
        if cell.category == .pizza && initialySelectedButton {
            cell.backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
            cell.textLabel.textColor = UIColor.systemPink
            cell.layer.borderWidth = 0
            cell.layer.cornerRadius = 18
        }
        
        return cell
    }
    
    // Scrolls category item section...
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true) // тоже самое при пролистывании menuController
        print(cell.textLabel.text)
        return true
    }
    
    // MARK: ItemSelected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if initialySelectedButton {
            initialySelectedButton = false
            let initialCell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0))
            initialCell?.isSelected = false
        }
        
        guard let foodKind = FoodKind(rawValue: indexPath.row) else { fatalError() }
        headerDelegate?.categoryChosen(foodKind)
    }
    
    
}
