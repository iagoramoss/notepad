//
//  NotesViewController.swift
//  Notepad
//
//  Created by Iago Ramos on 29/12/23.
//

import UIKit

final class NotesViewController: UITableViewController {
    let coordinator: Coordinator<NotesRouter>
    private let viewModel: NotesViewModel
    
    init(coordinator: Coordinator<NotesRouter>, viewModel: NotesViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notes"
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let title = viewModel.notes[safe: indexPath.item]?.title else { return NoteCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath)
        
        guard let cell = cell as? NoteCell else {
            let cell = NoteCell()
            cell.titleLabel.text = title
            return cell
        }
        
        cell.titleLabel.text = title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: nil, animated: false, scrollPosition: .none)
        guard let note = viewModel.notes[safe: indexPath.item] else { return }
        coordinator.show(.editNote(note, viewModel))
    }
}
