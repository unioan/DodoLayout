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
    init(view: MenuViewProtocol, data: [MenuItem])
}


class MenuPresenter: MenuViewPresenterProtocol {
    weak var view: MenuViewProtocol?
    let menuItems: [MenuItem]
    
    required init(view: MenuViewProtocol, data: [MenuItem]) {
        self.view = view
        self.menuItems = data
    }
    
    func foodKindSelected(_ foodKind: FoodKind) {
        print("DEBUG: presenter recived foodKIND \(foodKind)")
    }
    
}
