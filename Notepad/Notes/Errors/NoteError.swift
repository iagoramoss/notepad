//
//  NoteError.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

enum NoteError: LocalizedError {
    case notExists
    
    var errorDescription: String? {
        switch self {
        case .notExists:
            "There's no note with this ID!"
        }
    }
}
