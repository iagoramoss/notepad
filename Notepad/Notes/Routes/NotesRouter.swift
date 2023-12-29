//
//  NotesRouter.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import UIKit

enum NotesRouter: NavigationRouter {
    case notes
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .notes:
            return .push
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .notes:
            return UIViewController()
        }
    }
}
