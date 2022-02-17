//
//  MenuPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject { // Методы которые делегируются Menu controller
}

protocol MenuViewPresenterProtocol: AnyObject { // Требование к presenter
    init(view: MenuViewProtocol, data: MockData)
}

class MenuPresenter: MenuViewPresenterProtocol {
    let view: MenuViewProtocol
    let mockData: MockData
    
    required init(view: MenuViewProtocol, data: MockData) {
        self.view = view
        self.mockData = data
    }
    
    func foodKindSelected(_ foodKind: FoodKind) {
        
        print("DEBUG: presenter recived foodKIND \(foodKind)")
    }
    
    
}
