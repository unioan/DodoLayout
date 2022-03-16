//
//  Builder.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import UIKit

protocol AppBuilder: AnyObject {
    func createMainTabModule(router: RouterProtocol) -> UITabBarController
    func createMenuModule(router: RouterProtocol)  -> UIViewController
    func createMenuItemModule(menuItem: MenuItem, router: RouterProtocol) -> UIViewController
    func createLocationModule() -> UIViewController
    func createProfileModule() -> UIViewController
    func createPurchaseModule() -> UIViewController
}

class ModuleBuilder: AppBuilder {
    func createMainTabModule(router: RouterProtocol) -> UITabBarController {
        let presenter = MainTabPresenter([createMenuModule(router: router), createLocationModule(),
             createProfileModule(), createPurchaseModule()])
        
        let view = MainTabController()
        view.presenter = presenter

        return view
    }
    
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        let data = DataGenerator().menuItems()
        let view = MenuController()
        let presenter = MenuPresenter(view: view, data: data, router: router)
        view.presenter = presenter
        return view
    }
    
    func createMenuItemModule(menuItem: MenuItem, router: RouterProtocol) -> UIViewController {
        let data = menuItem
        let view = MenuItemViewController()
        let presenter = MenuItemPresenter(view: view, data: data, router: router)
        view.presenter = presenter
        return view
    }
    
    
    
    func createLocationModule() -> UIViewController {
        let view = LocationsController()
        return view
    }
    
    func createProfileModule() -> UIViewController {
        let view = ProfileController()
        return view
    }
    
    func createPurchaseModule() -> UIViewController {
        let view = PurchaseController()
        return view
    }
    

    
}
