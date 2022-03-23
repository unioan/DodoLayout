//
//  RouterMain.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 15.03.2022.
//

import UIKit

protocol RouterMain { // Требование ко всем роутерам (если нужно будет создать какой-то отдельный роутер)
    var tabBarController: UITabBarController? { get set }
    var navigationController: UINavigationController? { get set }
    var appBuilder: AppBuilder? { get set }
}

protocol RouterProtocol: RouterMain { // Роутер с конкретными конкретными контроллекрами
    func initialViewController(_ menuItem: MenuItem?) -> UITabBarController
    func show(menuItem: MenuItem)
    func getBackToMenuController(menuItem: MenuItem)
    func sendChosenItemToMenuPresenter(menuItem: MenuItem) 
}



final class Router: RouterProtocol {
    
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    var appBuilder: AppBuilder?
    
    init(appBuilder: AppBuilder) {
        self.appBuilder = appBuilder
    }
    
    func initialViewController(_ menuItem: MenuItem? = nil) -> UITabBarController {
        guard let menuTabModule = appBuilder?.createMainTabModule(router: self) else { return UITabBarController() }
        tabBarController = menuTabModule
        navigationController = menuTabModule.viewControllers?.first as? UINavigationController
        return menuTabModule
    }
    
    func show(menuItem: MenuItem) {
        if let navigationController = navigationController {
            guard let menuItemViewController = appBuilder?.createMenuItemModule(menuItem: menuItem, router: self) else { return }
            navigationController.pushViewController(menuItemViewController, animated: true)
        }
    }
    
    func getBackToMenuController(menuItem: MenuItem) {
        print("Router menuItem STATE \(menuItem.menuItemState)")
        guard let menuController = navigationController?.viewControllers.first as? MenuController else { return }
        
        menuController.presenter.replaceMenuItem(with: menuItem)
        menuController.presenter.updateCollectionView()
    }
    
    func sendChosenItemToMenuPresenter(menuItem: MenuItem) {
        guard let menuController = navigationController?.viewControllers.first as? MenuController else { return }
        menuController.presenter.updateChosenItems(with: menuItem)
    }
    
}
