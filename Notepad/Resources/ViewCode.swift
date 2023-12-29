//
//  ViewCode.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import Foundation

protocol ViewCode {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewCode {
    func addSubviews() {}
    func setupConstraints() {}
    func setupStyle() {}
    
    func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
}
