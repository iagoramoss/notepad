//
//  NoteViewController.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import UIKit

final class NoteViewController: UITableViewController {
    private let viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath)
        let title = viewModel.notes[indexPath.item].title
        
        guard let cell = cell as? NoteCell else {
            let cell = NoteCell()
            cell.titleLabel.text = title
            return cell
        }
        
        cell.titleLabel.text = title
        return cell
    }
}
