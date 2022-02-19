//
//  LayoutManger.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import UIKit

final class LayoutManger {
    
    static func createMenuControllerCollectionLayout() -> UICollectionViewLayout {
        
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
                item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0)
                
                
                // GROUP
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.21))
                let itemGroup = NSCollectionLayoutGroup.vertical(layoutSize: itemGroupSize, subitem: item, count: 1)
                
                
                // HEADER
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(68))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                header.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                header.pinToVisibleBounds = true

                
                // SECTION
                let section = NSCollectionLayoutSection(group: itemGroup)
                section.boundarySupplementaryItems = [header]
                
                return section
            }
        }
        return layout
    }
    
    
    static func createCategoryControllerCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment -> NSCollectionLayoutSection? in
            // ITEM
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 5)
            
            
             //GROUPS
            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
            let innerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: innerGroupSize, subitem: item, count: 1)
            
            let categoryGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(400), heightDimension: .fractionalHeight(1.0))
            let categoryGroup = NSCollectionLayoutGroup.horizontal(layoutSize: categoryGroupSize, subitems: [innerGroup])
            
            
            // SECTION
            let section = NSCollectionLayoutSection(group: categoryGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 18, bottom: 1, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            return section
            
        }
        return layout
    }
    
}
