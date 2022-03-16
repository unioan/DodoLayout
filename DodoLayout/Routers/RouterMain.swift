//
//  RouterMain.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 15.03.2022.
//

import UIKit

protocol RouterMain { // Требование ко всем роутерам (если нужно будет создать какой-то отдельный роутер)
    var navigationController: UINavigationController? { get set }
    var appBuilder: AppBuilder? { get set }
}

protocol RouterProtocol: RouterMain { // Роутер с конкретными конкретными контроллекрами
    func initialViewController() -> UITabBarController
    func show(menuItem: MenuItem)
  }



final class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var appBuilder: AppBuilder?
    
    init(appBuilder: AppBuilder) {
        self.appBuilder = appBuilder
    }
    
    func initialViewController() -> UITabBarController {
        guard let menuTabModule = appBuilder?.createMainTabModule(router: self) else { return UITabBarController() }
        navigationController = menuTabModule.viewControllers?.first as? UINavigationController
        return menuTabModule
    }
    
    func show(menuItem: MenuItem) {
        if let navigationController = navigationController {
            guard let menuItemViewController = appBuilder?.createMenuItemModule(menuItem: menuItem, router: self) else { return }
            navigationController.pushViewController(menuItemViewController, animated: true)
        }
    }
    
}
