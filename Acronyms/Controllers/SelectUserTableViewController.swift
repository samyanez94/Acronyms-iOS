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

    // MARK: - Initializers

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    init?(coder: NSCoder, selectedUser _: User) {
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {}

    // MARK: - Navigation

    override func prepare(for _: UIStoryboardSegue, sender _: Any?) {}
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
        return cell
    }
}
