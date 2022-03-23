//
//  MenuPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import Foundation
import UIKit

protocol MenuViewProtocol: AnyObject {
    func updateCollectionView()
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, data: [MenuItem], router: RouterProtocol)
    var chosenItems: [MenuItem] { get set }
}


class MenuPresenter: MenuViewPresenterProtocol {
    
    weak var view: MenuViewProtocol?
    var menuItems: [MenuItem]
    var router: RouterProtocol?
    var chosenItems = [MenuItem]()
    
    required init(view: MenuViewProtocol, data: [MenuItem], router: RouterProtocol) {
        self.view = view
        self.menuItems = data
        self.router = router
    }
    
    func replaceMenuItem(with menuItem: MenuItem) {
        guard let menuItemIndex = menuItem.menuItemIndex else { return }
        menuItems[menuItemIndex] = menuItem
    }
    
    func updateCollectionView() {
        view?.updateCollectionView()
    }
    
    func printchosenItemsCount() {
        print("DEBUG: chosenItemsCount \(chosenItems.count)")
    }
    
    func foodKindSelected(_ foodKind: FoodKind) {
        print("DEBUG: presenter recived foodKIND \(foodKind)")
    }
    
    func updateChosenItems(with menuItem: MenuItem) {
        
        if menuItem.menuItemState == .some {
            chosenItems.append(menuItem)
            updateCartBadge()
        } else {
            chosenItems.removeAll{ $0.itemName == menuItem.itemName }
            updateCartBadge()
        }
    }
    
    func updateCartBadge() {
        guard let tabBarItems = router?.tabBarController?.tabBar.items else { return }
        let cartItem = tabBarItems[3]
        let count = chosenItems.count
        
        if count > 0 {
            cartItem.badgeValue = "\(count)"
        } else {
            cartItem.badgeValue = nil
        }
    }
    
}
