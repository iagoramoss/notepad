//
//  NoteError.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

enum NotepadError: LocalizedError {
    case appDelegate
    case notExists
    case alreadyExists
    case emptyValue(NoteEntity)
    
    var errorDescription: String? {
        switch self {
        case .appDelegate:
            "Cannot convert 'UIApplication.shared.delegate' to 'AppDelegate'"
            
        case .notExists:
            "There's no note with this ID!"
            
        case .alreadyExists:
            "A note with this ID already exists!"
            
        case .emptyValue(let note):
            "Cannot parse 'NoteEntity' to 'Note' due to an empty value on NoteEntity: \(note.description)"
        }
    }
}
