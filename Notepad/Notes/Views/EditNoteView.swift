//
//  EditNoteView.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import UIKit

final class EditNoteView: UIView, ViewCode {
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.font = UIFont.preferredFont(forTextStyle: .title1)
        return textField
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupStyle()
    }
    
    func addSubviews() {
        addSubview(titleTextField)
        addSubview(textView)
    }
    
    func setupStyle() {
        backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
    }
    
    func setupConstraints() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
