//
//  CollectionViewController.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    let headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = headerView
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
    
}
