//
//  MenuPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
    func updateCollectionView()
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, data: [MenuItem], router: RouterProtocol)
}


class MenuPresenter: MenuViewPresenterProtocol {

    weak var view: MenuViewProtocol?
    var menuItems: [MenuItem]
    var router: RouterProtocol?
    
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
    
    func foodKindSelected(_ foodKind: FoodKind) {
        print("DEBUG: presenter recived foodKIND \(foodKind)")
    }
    
}
