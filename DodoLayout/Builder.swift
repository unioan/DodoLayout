//
//  Builder.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import UIKit

protocol Builder: AnyObject {
    static func createMainTabModule() -> UITabBarController
    static func createMenuModule() -> UIViewController
    static func createLocationModule() -> UIViewController
    static func createProfileModule() -> UIViewController
    static func createPurchaseModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainTabModule() -> UITabBarController {
        
        let presenter = MainTabPresenter(
            viewControllers: [createMenuModule(), createLocationModule(),
                              createProfileModule(), createPurchaseModule()])
        
        let view = MainTabController()
        view.presenter = presenter

        return view
    }
    
    static func createMenuModule() -> UIViewController {
        let data = GenerateData().menuItems()
        let view = MenuController()
        let presenter = MenuPresenter(view: view, data: data)
        view.presenter = presenter
        return view
    }
    
    static func createLocationModule() -> UIViewController {
        let view = LocationsController()
        return view
    }
    
    static func createProfileModule() -> UIViewController {
        let view = ProfileController()
        return view
    }
    
    static func createPurchaseModule() -> UIViewController {
        let view = PurchaseController()
        return view
    }
    
}
