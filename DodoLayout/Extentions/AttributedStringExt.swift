//
//  NSAttributedString.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 18.02.2022.
//

import UIKit

extension NSAttributedString {
    
    static func setPrice(_ value: Int) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string: "\(value)",
                                                       attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                                                    .foregroundColor: UIColor.systemPink])
        
        attributedText.append(NSAttributedString(string: " р",
                                                 attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                                              .foregroundColor: UIColor.systemPink]))
        return attributedText
    }
    
    static func setPriceForMenuItem(_ value: Int) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string: "\(value)",
                                                       attributes: [.font: UIFont.boldSystemFont(ofSize: 18),
                                                                    .foregroundColor: UIColor.systemPink])
        
        attributedText.append(NSAttributedString(string: " р",
                                                 attributes: [.font: UIFont.boldSystemFont(ofSize: 18),
                                                              .foregroundColor: UIColor.systemPink]))
        return attributedText
    }
    
}

