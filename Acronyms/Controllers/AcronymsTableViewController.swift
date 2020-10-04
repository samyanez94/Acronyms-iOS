//
//  AcronymsTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class AcronymsTableViewController: UITableViewController {
    // MARK: - Properties

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        refresh(nil)
    }

    // MARK: - Navigation

    @IBSegueAction func makeAcronymsDetailTableViewController(_: NSCoder) -> AcronymDetailTableViewController? {
        return nil
    }

    // MARK: - IBActions

    @IBAction func refresh(_ sender: UIRefreshControl?) {
        DispatchQueue.main.async {
            sender?.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource

extension AcronymsTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymCell", for: indexPath)
        return cell
    }
}