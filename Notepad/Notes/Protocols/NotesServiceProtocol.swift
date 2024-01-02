//
//  NotesServiceProtocol.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

protocol NotesServiceProtocol {
    func getNotes() throws -> [Note]
    func createNote(_ note: Note) throws
    func editNote(_ note: Note) throws
    func deleteNote(by id: UUID) throws
}
