//
//  EditNoteViewController.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import UIKit

final class EditNoteViewController: UIViewController {
    let note: Note
    let editNoteView = EditNoteView()
    
    init(note: Note) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        editNoteView.titleTextField.text = note.title
        editNoteView.textView.text = note.text
        
        view = editNoteView
    }
}
