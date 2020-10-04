//
//  CreateUserTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class CreateUserTableViewController: UITableViewController {
    // MARK: - IBOutlets

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
    }

    // MARK: - IBActions

    @IBAction func cancel(_: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func save(_: Any) {
        navigationController?.popViewController(animated: true)
    }
}
