//
//  CartItem.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 21.03.2022.
//

import UIKit

struct CartItem: CustomStringConvertible, Equatable {
    var description: String {
        return "cartItem of kind \(foodKind), name \(itemName), price \(price) selected"
    }
    let foodKind: FoodKind
    let itemName: String
    let price: Int
    let image: UIImage
    var menuItemState: MenuItemState
    var menuItemIndex: Int?
    
    init(with menuItem: MenuItem) {
        foodKind = menuItem.foodKind
        itemName = menuItem.itemName
        price = menuItem.price
        image = menuItem.image
        menuItemState = menuItem.menuItemState
        menuItemIndex = menuItem.menuItemIndex
    }
    
}
