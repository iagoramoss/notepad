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
        
        setupNavigationBar()
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            self.coordinator.show(.editNote(self.viewModel))
        }
        
        let button = UIButton(primaryAction: action)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        
        navigationItem.title = "Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNotes().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let title = viewModel.getNotes()[safe: indexPath.item]?.title else { return NoteCell() }
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
        guard let note = viewModel.getNotes()[safe: indexPath.item] else { return }
        coordinator.show(.editNote(viewModel, note))
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let note = viewModel.getNotes()[safe: indexPath.item] else { return nil }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { [weak self] action, view, completion in
            
            guard let self = self else {
                completion(false)
                return
            }
            
            let alert = UIAlertController(title: "Do you want to delete this note?",
                                          message: "This action cannot be undone.",
                                          preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                 completion(true)
            }
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
                self?.viewModel.deleteNote(by: note.id)
                
                tableView.reloadData()
                completion(true)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(deleteAction)
            
            self.present(alert, animated: true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        
        let editAction = UIContextualAction(style: .normal, title: "edit") { [weak self] action, view, completion in
            
            guard let self = self else {
                completion(false)
                return
            }
            
            self.coordinator.show(.editNote(viewModel, note))
            completion(true)
        }
        
        editAction.backgroundColor = .systemYellow
        editAction.image = UIImage(systemName: "square.and.pencil")
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
