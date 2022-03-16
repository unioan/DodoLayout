//
//  MenuPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, data: [MenuItem], router: RouterProtocol)
    func menuItemTapped(menuItem: MenuItem)
}


class MenuPresenter: MenuViewPresenterProtocol {

    weak var view: MenuViewProtocol?
    let menuItems: [MenuItem]
    var router: RouterProtocol?
    
    required init(view: MenuViewProtocol, data: [MenuItem], router: RouterProtocol) {
        self.view = view
        self.menuItems = data
        self.router = router
    }
    
    func menuItemTapped(menuItem: MenuItem) {
        router?.show(menuItem: menuItem)
    }
    
    func foodKindSelected(_ foodKind: FoodKind) {
        print("DEBUG: presenter recived foodKIND \(foodKind)")
    }
    
}
