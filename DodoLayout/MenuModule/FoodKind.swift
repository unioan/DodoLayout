//
//  FoodCategory.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import Foundation

enum FoodKind: Int, CaseIterable {
    case pizza
    case burger
    case appetizer
    case sauces
    case beverage
    case dessert
    
    var foodString: String {
        switch self {
        case .pizza:
            return "Пицца"
        case .burger:
            return "Бургеры"
        case .appetizer:
            return "Закуски"
        case .sauces:
            return "Соусы"
        case .beverage:
            return "Напитки"
        case .dessert:
            return "Десерты"
        }
    }
}
