//
//  BanerCell.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit

final class BanerCell: UICollectionViewCell {
    static let reuseIdentifier = "BanerCell"
    
    public var bannerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "pizzaBanner")
        iv.layer.cornerRadius = 18
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
