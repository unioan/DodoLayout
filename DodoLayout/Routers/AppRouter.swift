//
//  AppRouter.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 15.03.2022.
//

import UIKit

protocol AppRouter {  // Устанавливает общие требования к Router ( иметь navigation и builder)
    var navigationController: UINavigationController? { get set }
    var appBuilder: AppBuilder? { get set }
}

protocol RouterProtocol { // Функционал Router
    func initialViewController()
    func initialViewController()
}



