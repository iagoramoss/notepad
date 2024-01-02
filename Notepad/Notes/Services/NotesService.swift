//
//  NotesService.swift
//  Notepad
//
//  Created by Iago Ramos on 02/01/24.
//

import UIKit
import CoreData

final class NotesService: NotesServiceProtocol {
    private let appDelegate = (UIApplication.shared.delegate) as? AppDelegate
    
    private func getNoteEntities() throws -> [NoteEntity] {
        guard let appDelegate = appDelegate else { throw NotepadError.appDelegate }
        
        let fetchRequest = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        return try appDelegate.context.fetch(fetchRequest)
    }
    
    func getNotes() throws -> [Note] {
        guard let appDelegate = appDelegate else { throw NotepadError.appDelegate }
        
        let notes = try getNoteEntities()
        
        return try getNoteEntities().map({
            guard let id = $0.id, let date = $0.date, let title = $0.title, let text = $0.text else {
                throw NotepadError.emptyValue($0)
            }
            
            return Note(id: id, date: date, title: title, text: text)
        })
    }
    
    func createNote(_ note: Note) throws {
        guard let appDelegate = appDelegate else { throw NotepadError.appDelegate }
        
        guard try getNoteEntities().first(where: { $0.id == note.id }) == nil else {
            throw NotepadError.alreadyExists
        }
        
        let noteEntity = NoteEntity(context: appDelegate.context)
        
        noteEntity.id = note.id
        noteEntity.date = note.date
        noteEntity.title = note.title
        noteEntity.text = note.text
        
        appDelegate.saveContext()
    }
    
    func editNote(_ note: Note) throws {
        guard let appDelegate = appDelegate else { throw NotepadError.appDelegate }
        
        guard let editedNote = try getNoteEntities().first(where: { $0.id == note.id }) else {
            throw NotepadError.notExists
        }
        
        editedNote.title = note.title
        editedNote.text = note.text
        
        appDelegate.saveContext()
    }
    
    func deleteNote(by id: UUID) throws {
        guard let appDelegate = appDelegate else { throw NotepadError.appDelegate }
        
        guard let deletedNote = try getNoteEntities().first(where: { $0.id == id }) else {
            throw NotepadError.notExists
        }
        
        appDelegate.context.delete(deletedNote)
        appDelegate.saveContext()
    }
}
