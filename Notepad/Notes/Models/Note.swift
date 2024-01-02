//
//  Note.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

class Note {
    let id = UUID()
    let date = Date()
    var title: String
    var text: String
    
    init(title: String = "", text: String = "") {
        self.title = title
        self.text = text
    }
}
