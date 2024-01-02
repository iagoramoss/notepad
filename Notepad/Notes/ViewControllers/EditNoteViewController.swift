//
//  EditNoteViewController.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import UIKit

final class EditNoteViewController: UIViewController {
    private let note: Note
    private let viewModel: NotesViewModel
    
    private let editNoteView = EditNoteView()
    private let isNewNote: Bool
    
    init(note: Note, viewModel: NotesViewModel) {
        self.note = note
        self.viewModel = viewModel
        self.isNewNote = note.title.isEmpty && note.text.isEmpty
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNoteView.titleTextField.delegate = self
        editNoteView.textView.delegate = self
        
        editNoteView.titleTextField.text = note.title
        editNoteView.textView.text = note.text
        
        view = editNoteView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveTitle()
        isNewNote ? viewModel.createNote(note) : viewModel.editNote(note)
    }
    
    private func saveTitle() {
        note.title = editNoteView.titleTextField.text ?? ""
        
        if note.title.isEmpty {
            note.title = "Untitled"
        }
    }
}

extension EditNoteViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        saveTitle()
    }
}

extension EditNoteViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note.text = textView.text ?? ""
    }
}
