//
//  NotesViewModel.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

final class NotesViewModel {
    private let service: NotesServiceProtocol
    
    init(service: NotesServiceProtocol) {
        self.service = service
    }
    
    func getNotes() -> [Note] {
        service.getNotes()
    }
    
    func createNote(_ note: Note) {
        service.createNote(note)
    }
    
    func editNote(_ note: Note) {
        do {
            try service.editNote(note)
        } catch {
            print("Error while trying to edit note: \(error.localizedDescription)")
        }
    }
    
    func deleteNote(by id: UUID) {
        service.deleteNote(by: id)
    }
}
