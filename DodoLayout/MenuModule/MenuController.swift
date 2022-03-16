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
    
    var chosenMenuItemIndex: IndexPath?
    var needsOffset = false
    
    let cityPickerButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Москва", style: .plain, target: self, action: nil)
        barButton.setTitleTextAttributes([.font: UIFont(name: "Helvetica", size: 16)!,
                                                 .foregroundColor: UIColor.black], for: .normal)
        return barButton
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = cityPickerButton
        
        configureCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    // MARK: Helpers
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: LayoutManger.createMenuControllerCollectionLayout())
        view.addSubview(collectionView)
        collectionView.register(BanerCell.self, forCellWithReuseIdentifier: BanerCell.reuseIdentifier)
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: MenuItemCell.reuseIdentifier)
        collectionView.register(CategoryPickerView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryPickerView.reuseIdentifier)
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.reuseIdentifier, for: indexPath) as! MenuItemCell
            
            cell.foodKind = presenter.menuItems[itemIndex].foodKind
            cell.ItemImageView.image = presenter.menuItems[itemIndex].image
            cell.itemNameLabel.text = presenter.menuItems[itemIndex].itemName
            cell.captionLabel.text = presenter.menuItems[itemIndex].caption
            cell.priceButton.setAttributedTitle(.setPrice(presenter.menuItems[itemIndex].price), for: .normal)
        
            return cell
        }
        
        
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryPickerView.reuseIdentifier, for: indexPath) as! CategoryPickerView
        header.headerDelegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let chosenMenuItemIndex = chosenMenuItemIndex else { return }
        
        if chosenMenuItemIndex == indexPath && chosenMenuItemIndex == IndexPath(row: 0, section: SectionKind.item.rawValue) {
            self.needsOffset = false
            self.chosenMenuItemIndex = nil
        } else if chosenMenuItemIndex == indexPath && needsOffset {
            let marginFromTopViews = view.safeAreaInsets.top + 60
            let point = cell.frame.origin.y
            collectionView.setContentOffset(CGPoint(x: 0, y: point - marginFromTopViews), animated: false)
            needsOffset = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItem = presenter.menuItems[indexPath.row]
        presenter.menuItemTapped(menuItem: menuItem)
    }
    
}

// MARK: - CategoryPickerViewDelegate (Header)
extension MenuController: CategoryPickerViewDelegate {
    func categoryChosen(_ foodKind: FoodKind) {
        let chosenItemIndexInArray = presenter.menuItems.firstIndex { $0.foodKind == foodKind }
        
        let cellIndexOfFirstItemInKind = IndexPath(row: chosenItemIndexInArray ?? 0, section: SectionKind.item.rawValue)
        
        if cellIndexOfFirstItemInKind == IndexPath(row: 0, section: SectionKind.item.rawValue) {
            collectionView.scrollToItem(at: cellIndexOfFirstItemInKind, at: .centeredVertically, animated: true)
        } else if cellIndexOfFirstItemInKind != chosenMenuItemIndex {
            collectionView.scrollToItem(at: cellIndexOfFirstItemInKind, at: .top, animated: true)
            needsOffset = true
        }
        
        chosenMenuItemIndex = cellIndexOfFirstItemInKind
    }
    
}

// MARK: - MenuViewProtocol
extension MenuController: MenuViewProtocol {
}
