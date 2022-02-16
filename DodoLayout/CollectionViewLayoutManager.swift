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
            item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 5)
            
             //GROUP
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
