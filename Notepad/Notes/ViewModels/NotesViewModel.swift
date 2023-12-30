//
//  NotesViewModel.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

final class NotesViewModel {
    private(set) var notes: [Note] = []
    
    init() {
        for i in 0...10 {
            notes.append(Note(title: "nota \(i)", text: "texto \(i)"))
        }
    }
}
