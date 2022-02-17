//
//  MainTabController.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 16.02.2022.
//

import UIKit


class MainTabController: UITabBarController {
    
    // MARK: Properties
    var presenter: MainTabPresenterProtocol! {
        didSet { configureViewControllers() }
    }
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setViews()
    }
    
    
    // MARK: Helpers
    func setViews() {
        view.backgroundColor = .white
        tabBar.tintColor = .systemOrange
    }
    
    func configureViewControllers() {
        
        var tabControllers = [UINavigationController]()
        guard let presenter = presenter else { return }
        
        for index in 0..<presenter.viewControllers.count {
            if index == 0 {
                let menu = tamplateNavigationController(title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!, rootViewController: presenter.viewControllers[index])
                tabControllers.append(menu)
                
            } else if index == 1 {
                let location = tamplateNavigationController(title: "Контакты", image: UIImage(systemName: "mappin")!, rootViewController: presenter.viewControllers[index])
                tabControllers.append(location)
                
            } else if index == 2 {
                let profile = tamplateNavigationController(title: "Профиль", image: UIImage(systemName: "person.fill")!, rootViewController: presenter.viewControllers[index])
                tabControllers.append(profile)
                
            } else if index == 3 {
                let purchaise = tamplateNavigationController(title: "Корзина", image: UIImage(systemName: "cart.fill")!, rootViewController: presenter.viewControllers[index])
                tabControllers.append(purchaise)
            }
        }
        
        viewControllers = tabControllers
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
