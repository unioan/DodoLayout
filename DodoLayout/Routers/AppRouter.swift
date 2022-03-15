//
//  AppRouter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 15.03.2022.
//

import UIKit

final class AppRouter {
    
    private let tabController: UITabBarController
    private let appBuilder: AppBuilder
    
    init(tabController: UITabBarController, appBuilder: AppBuilder) {
        self.tabController = tabController
        self.appBuilder = appBuilder
    }
    
}
