//
//  CategoryCollectionView.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

class CategoriesCollectionView: UICollectionView {

    
    init() {
        super.init(frame: CGRect(), collectionViewLayout: CollectionViewLayoutManager.createLayout())
        register(ItemCategory.self, forCellWithReuseIdentifier: ItemCategory.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

