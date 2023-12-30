//
//  NotesMockupService.swift
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

protocol NotesService {
    func editNote(_ note: Note) throws
    func getNotes() -> [Note]
}

final class NotesMockupService: NotesService {
    private var notes: [Note] = []
    
    init() {
        for i in 0...10 {
            notes.append(Note(title: "nota \(i)", text: "texto \(i)"))
        }
    }
    
    func editNote(_ note: Note) throws {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else {
            throw NoteError.notExists
        }
        
        notes[index] = note
    }
    
    func getNotes() -> [Note] { notes }
}
