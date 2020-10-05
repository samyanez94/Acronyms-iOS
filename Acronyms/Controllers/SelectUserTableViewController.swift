//
//  SelectUserTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class SelectUserTableViewController: UITableViewController {

    // MARK: - Properties

    var users: [User] = []

    var selectedUser: User

    // MARK: - Initializers

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    init?(coder: NSCoder, selectedUser: User) {
        self.selectedUser = selectedUser
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        let usersRequest = ResourceRequest<User>(resourcePath: "users")
        usersRequest.getAll { [weak self] result in
            switch result {
            case .failure:
                let message = "There was an error getting the users"
                ErrorPresenter.showError(message: message, on: self) { _ in
                    self?.navigationController?.popViewController(animated: true)
                }
            case let .success(users):
                self?.users = users
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindSelectUserSegue" {
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else { return }
            selectedUser = users[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource

extension SelectUserTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectUserCell", for: indexPath)
        cell.textLabel?.text = user.name
        if user.name == selectedUser.name {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}
