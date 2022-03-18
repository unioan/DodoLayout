//
//  MenuItem.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 18.02.2022.
//

import UIKit

struct MenuItem: CustomStringConvertible {
    var description: String {
        return "menuItem of kind \(foodKind), name \(itemName), price \(price) selected"
    }
    let foodKind: FoodKind
    let itemName: String
    let caption: String
    let price: Int
    let image: UIImage
    var quantity: Int?
    var menuItemState: MenuItemState = .empty
    var menuItemIndex: Int?
}
