//
//  Coordinator.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import UIKit

enum NavigationTransitionStyle {
    case push
    case presentModally
    case presentFullscreen
}

protocol NavigationRouter {
    var transition: NavigationTransitionStyle { get }
    func viewController(coordinator: Coordinator<Self>) -> UIViewController
}

final class Coordinator<Router: NavigationRouter> {
    let navigationController: UINavigationController
    private let root: Router
    
    init(root: Router, navigationController: UINavigationController = .init()) {
        self.root = root
        self.navigationController = navigationController
    }
    
    func start() {
        show(root)
    }
    
    func show(_ route: Router, animated: Bool = true) {
        switch route.transition {
        case .push:
            navigationController.pushViewController(route.viewController(coordinator: self), animated: animated)
            
        case .presentModally:
            navigationController.modalPresentationStyle = .formSheet
            navigationController.present(route.viewController(coordinator: self), animated: animated)
            
        case .presentFullscreen:
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.present(route.viewController(coordinator: self), animated: animated)
        }
    }
}
