//
//  AcronymDetailTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class AcronymDetailTableViewController: UITableViewController {
    // MARK: - Properties

    var acronym: Acronym {
        didSet {
            updateAcronymView()
        }
    }

    var user: User? {
        didSet {
            updateAcronymView()
        }
    }

    var categories: [Category] {
        didSet {
            updateAcronymView()
        }
    }

    // MARK: - Initializers

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    init?(coder: NSCoder, acronym: Acronym) {
        self.acronym = acronym
        categories = []
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Override `prefersLargeTitles`.
        navigationController?.navigationBar.prefersLargeTitles = false

        // Get acronyms from API.
        getAcronymData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Get acronyms from API.
        getAcronymData()
    }

    // MARK: - Model Loading

    func getAcronymData() {}

    func updateAcronymView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Navigation

    override func prepare(for _: UIStoryboardSegue, sender _: Any?) {}

    @IBSegueAction func makeAddToCategoryController(_: NSCoder) -> AddToCategoryTableViewController? {
        return nil
    }

    // MARK: - IBActions

    @IBAction func updateAcronymDetails(_: UIStoryboardSegue) {}
}

// MARK: - UITableViewDataSource

extension AcronymDetailTableViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        return 4
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 3 ? categories.count : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymDetailCell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = acronym.short
        case 1:
            cell.textLabel?.text = acronym.long
        case 2:
            cell.textLabel?.text = user?.name
        case 3:
            cell.textLabel?.text = categories[indexPath.row].name
        default:
            break
        }
        return cell
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Acronym"
        case 1:
            return "Meaning"
        case 2:
            return "User"
        case 3:
            return "Categories"
        default:
            return nil
        }
    }
}
