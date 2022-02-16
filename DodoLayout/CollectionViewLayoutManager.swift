//
//  CollectionViewLayoutManager.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class CollectionViewLayoutManager {
    
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.02), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let itemSpacing: CGFloat = 2 // items отступят со всех краев 5 поинтов
            item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing, leading: itemSpacing, bottom: itemSpacing, trailing: itemSpacing)
            
            // GROUP
            let categoryGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(600), heightDimension: .fractionalHeight(1.0))
            let categoryGroup = NSCollectionLayoutGroup.horizontal(layoutSize: categoryGroupSize, subitem: item, count: 1)
            
            // SECTION
            let section = NSCollectionLayoutSection(group: categoryGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
            
        }
        return layout
    }
}
