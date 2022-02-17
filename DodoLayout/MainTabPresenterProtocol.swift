//
//  MainPresenter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 17.02.2022.
//

import UIKit

protocol MainTabView: AnyObject {
    
}

protocol MainTabPresenterProtocol: AnyObject {
    init(viewControllers: [UIViewController])
    var viewControllers: [UIViewController] { get }
}


class MainTabPresenter: MainTabPresenterProtocol {
    var viewControllers: [UIViewController]
    
    
    required init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    
}
