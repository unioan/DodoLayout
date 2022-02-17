//
//  MainTabController.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit


class MainTabController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        
      
    }
    
    
    
    func configureViewControllers() {
        view.backgroundColor = .white
        
        self.delegate = self
        
        let menu = tamplateNavigationController(title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!, rootViewController: MenuController())
        
        let location = tamplateNavigationController(title: "Контакты", image: UIImage(systemName: "mappin")!, rootViewController: LocationsController())
        
        let profile = tamplateNavigationController(title: "Профиль", image: UIImage(systemName: "person.fill")!, rootViewController: ProfileController())
        
        let purchaise = tamplateNavigationController(title: "Корзина", image: UIImage(systemName: "cart.fill")!, rootViewController: PurchaseController())
        
        viewControllers = [menu, location, profile, purchaise]
        
        tabBar.tintColor = .systemOrange
    }
    
    func tamplateNavigationController(title: String, image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        
        return nav
    }
    
    
}

// MARK: - UITabBarControllerDelegate
extension MainTabController: UITabBarControllerDelegate { // срабатывает по нажатию на любую кнопку tabBar
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        
        print("DEBUG: index tapped \(index!)")
        return true
    }
}
