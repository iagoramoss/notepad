//
//  NotesMockupService.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

final class NotesMockupService: NotesServiceProtocol {
    private var notes: [Note] = []
    
    init() {
        for i in 0...10 {
            notes.append(Note(title: "nota \(i)", text: "texto \(i)"))
        }
    }
    
    func getNotes() -> [Note] { notes }
    
    func createNote(_ note: Note) {
        notes.append(note)
    }
    
    func editNote(_ note: Note) throws {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else {
            throw NoteError.notExists
        }
        
        notes[index] = note
    }
}
