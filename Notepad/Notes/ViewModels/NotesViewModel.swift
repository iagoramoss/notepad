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
        do {
            return try service.getNotes().sorted(by: { $0.date < $1.date })
        } catch {
            print("Error while fetching notes: \(error.localizedDescription)")
            return []
        }
    }
    
    func createNote(_ note: Note) {
        do {
            try service.createNote(note)
        } catch {
            print("Error while creating note: \(error.localizedDescription)")
        }
    }
    
    func editNote(_ note: Note) {
        do {
            try service.editNote(note)
        } catch {
            print("Error while trying to edit note: \(error.localizedDescription)")
        }
    }
    
    func deleteNote(by id: UUID) {
        do {
            try service.deleteNote(by: id)
        } catch {
            print("Error while deleting note: \(error.localizedDescription)")
        }
    }
}
