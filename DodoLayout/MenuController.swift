//
//  ViewController.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class MenuController: UIViewController {
    
    enum SectionKind: Int, CaseIterable {
        case baner
        case item
    }
    
    
    let bannerArray = Array(1...20)
    let categoryArray = Array(21...40)
    let itemsArray = Array(41...60)
    
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        configureCollectionView()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //register cell
        collectionView.register(BanerCell.self, forCellWithReuseIdentifier: BanerCell.reuseIdentifier)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    
    
    
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment -> NSCollectionLayoutSection? in
            
            guard let sectionKind = SectionKind(rawValue: sectionIndex) else { return nil }
            
            switch sectionKind {
            case .baner:
                // ITEM
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let itemSpacing: CGFloat = 10 // items отступят со всех краев 5 поинтов
                item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing, leading: 0, bottom: itemSpacing, trailing: 20)
                
                // GROUP
                let banerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.18))
                let banerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: banerGroupSize, subitem: item, count: 1)
                
                // SECTION
                let section = NSCollectionLayoutSection(group: banerGroup)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing, leading: 18, bottom: itemSpacing, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                return section
                
            case .item:
                // ITEM
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let itemSpacing: CGFloat = 10 // items отступят со всех краев 5 поинтов
                item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing, leading: 0, bottom: itemSpacing, trailing: 0)
                
                // GROUP
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
                let itemGroup = NSCollectionLayoutGroup.vertical(layoutSize: itemGroupSize, subitem: item, count: 1)
                
                // SECTION
                let section = NSCollectionLayoutSection(group: itemGroup)
                
                // HEADER
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(68))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                header.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [header]
                header.pinToVisibleBounds = true
                return section
                
            }
            
            
            
        }
        return layout
    }

}


extension MenuController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionKind = SectionKind(rawValue: section) else { fatalError() }
        switch sectionKind {
        case .baner:
            return bannerArray.count
        case .item:
            return itemsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionKind = SectionKind(rawValue: indexPath.section) else { fatalError() }
        
        switch sectionKind {
        case .baner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BanerCell.reuseIdentifier, for: indexPath) as! BanerCell
            cell.textLabel.text = "\(bannerArray[indexPath.row])"
            cell.backgroundColor = .systemRed
            return cell
        case .item:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell
            cell.textLabel.text = "\(itemsArray[indexPath.row])"
            cell.backgroundColor = .systemYellow
            return cell
        }
    
       
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
        let controller = CollectionViewController()
        cell.controller = controller
        
        return cell
    }
    
   
    
}
