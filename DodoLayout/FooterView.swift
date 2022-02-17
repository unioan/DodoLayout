//
//  FooterView.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import UIKit

class FooterView: UICollectionReusableView {
    static let reuseIdentifier = "FooterView"
    
    
    public lazy var brakeLine: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.backgroundColor = .yellow
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupBreakeLineConstraints()
    }
    
    private func setupBreakeLineConstraints() {
        addSubview(brakeLine)
        brakeLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([brakeLine.topAnchor.constraint(equalTo: topAnchor),
                                     brakeLine.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     brakeLine.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     brakeLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
