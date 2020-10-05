//
//  AddToCategoryTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class AddToCategoryTableViewController: UITableViewController {

    // MARK: - Properties

    private var categories: [Category] = []

    private let selectedCategories: [Category]

    private let acronym: Acronym

    // MARK: - Initialization

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    init?(coder: NSCoder, acronym: Acronym, selectedCategories: [Category]) {
        self.acronym = acronym
        self.selectedCategories = selectedCategories
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {}
}

// MARK: - UITableViewDataSource

extension AddToCategoryTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = category.name

        let isSelected = selectedCategories.contains { element in
            element.name == category.name
        }

        if isSelected {
            cell.accessoryType = .checkmark
        }

        return cell
    }
}
