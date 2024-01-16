//
//  Note.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

class Note {
    let id: UUID
    let date: Date
    
    var title: String
    var text: String
    var isLocked: Bool
    
    init(id: UUID = .init(), 
         date: Date = . init(),
         title: String = "",
         text: String = "",
         isLocked: Bool = false) {
        
        self.id = id
        self.date = date
        self.title = title
        self.text = text
        self.isLocked = isLocked
    }
}
