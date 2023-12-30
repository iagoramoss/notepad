//
//  EditNoteViewController.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import UIKit

final class EditNoteViewController: UIViewController {
    let note: Note
    let viewModel: NotesViewModel
    
    let editNoteView = EditNoteView()
    
    init(note: Note, viewModel: NotesViewModel) {
        self.note = note
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNoteView.titleTextField.text = note.title
        editNoteView.textView.text = note.text
        
        view = editNoteView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let title = editNoteView.titleTextField.text, let text = editNoteView.textView.text else { return }
        
        let isNewNote =  note.title.isEmpty && note.text.isEmpty
        
        note.title = title
        note.text = text
        
        isNewNote ? viewModel.createNote(note) : viewModel.editNote(note)
    }
}
