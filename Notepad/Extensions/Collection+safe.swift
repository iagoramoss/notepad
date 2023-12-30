//
//  Collection+safe.swift
//  Notepad
//
//  Created by Iago Ramos on 30/12/23.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
