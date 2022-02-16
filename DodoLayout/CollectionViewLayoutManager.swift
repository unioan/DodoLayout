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
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let itemSpacing: CGFloat = 10 // items отступят со всех краев 5 поинтов
            item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
            
            // GROUP
            let categoryGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.1), heightDimension: .fractionalHeight(1.0))
            let categoryGroup = NSCollectionLayoutGroup.horizontal(layoutSize: categoryGroupSize, subitem: item, count: 1)
            
            // SECTION
            let section = NSCollectionLayoutSection(group: categoryGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
            
        }
        return layout
    }
}
