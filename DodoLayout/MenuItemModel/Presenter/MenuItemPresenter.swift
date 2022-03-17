//
//  MenuItemPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.03.2022.
//

import Foundation

protocol MenuItemViewProtocol: AnyObject {
}

protocol MenuItemPresenterProtocol: AnyObject  {
    init(view: MenuItemViewProtocol, data: MenuItem, router: RouterProtocol)
}

final class MenuItemPresenter: MenuItemPresenterProtocol {

    weak var view: MenuItemViewProtocol?
    var menuItem: MenuItem
    var router: RouterProtocol
    
    init(view: MenuItemViewProtocol, data: MenuItem, router: RouterProtocol) {
        self.view = view
        self.menuItem = data
        self.router = router
    }
    
    
    
}
