//
//  NotesViewModel.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

final class NotesViewModel {
    private let service: NotesService
    private(set) var notes: [Note] = []
    
    init(service: NotesService) {
        self.service = service
        self.notes = service.getNotes()
    }
    
    func editNote(_ note: Note) {
        do {
            try service.editNote(note)
        } catch {
            print("Error while trying to edit note: \(error.localizedDescription)")
        }
    }
}
