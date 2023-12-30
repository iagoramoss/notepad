//
//  NotesRouter.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import UIKit

enum NotesRouter: NavigationRouter {
    case notes(NotesViewModel)
    case editNote(NotesViewModel, Note = .init())
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .notes:
            return .push
            
        case .editNote:
            return .push
        }
    }
    
    func viewController(coordinator: Coordinator<Self>) -> UIViewController {
        switch self {
        case .notes(let viewModel):
            return NotesViewController(coordinator: coordinator, viewModel: viewModel)
        
        case .editNote(let viewModel, let note):
            return EditNoteViewController(note: note, viewModel: viewModel)
        }
    }
}
