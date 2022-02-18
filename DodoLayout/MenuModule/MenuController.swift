//
//  ViewController.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

final class MenuController: UIViewController {
    
    // MARK: Properties
    var presenter: MenuPresenter!
    var collectionView: UICollectionView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    // MARK: Helpers
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: LayoutManger.createMenuControllerCollectionLayout())
        view.addSubview(collectionView)
        collectionView.register(BanerCell.self, forCellWithReuseIdentifier: BanerCell.reuseIdentifier)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
}



// MARK: - UICollectionViewDataSource
extension MenuController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: NumberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionKind.allCases.count
    }
    
    // MARK: NumberOfItems
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionKind = SectionKind(rawValue: section) else { fatalError() }
        switch sectionKind {
        case .baner:
            return 6
        case .item:
            return presenter.menuItems.count
        }
    }
    
    // MARK: CellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemIndex = indexPath.row
        guard let sectionKind = SectionKind(rawValue: indexPath.section) else { fatalError() }
        
        switch sectionKind {
            
        case .baner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BanerCell.reuseIdentifier, for: indexPath) as! BanerCell
            return cell
            
        case .item:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell
            cell.ItemImageView.image = presenter.menuItems[itemIndex].image
            cell.itemNameLabel.text = presenter.menuItems[itemIndex].itemName
            cell.captionLabel.text = presenter.menuItems[itemIndex].caption
            cell.priceButton.setAttributedTitle(.setPrice(presenter.menuItems[itemIndex].price), for: .normal)
        
            cell.backgroundColor = .white
            return cell
        }
        
        
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
        header.headerDelegate = self
        return header
    }
    
}

// MARK: - HeaderViewDelegate
extension MenuController: HeaderViewDelegate {
    func categoryChosen(_ foodKind: FoodKind) {
        presenter.foodKindSelected(foodKind)
        collectionView.scrollToItem(at: IndexPath(row: 10, section: 1), at: .top, animated: true)
        print("DEBUG: Menu Controller recived category \(foodKind) from header")
    }
}

extension MenuController: MenuViewProtocol {
}
