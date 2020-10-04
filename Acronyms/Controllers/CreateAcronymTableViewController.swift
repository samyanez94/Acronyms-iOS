//
//  CreateAcronymTableViewController.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import UIKit

class CreateAcronymTableViewController: UITableViewController {
    // MARK: - IBOutlets

    @IBOutlet var acronymShortTextField: UITextField!
    @IBOutlet var acronymLongTextField: UITextField!
    @IBOutlet var userLabel: UILabel!

    // MARK: - Properties

    var selectedUser: User?

    var acronym: Acronym?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        acronymShortTextField.becomeFirstResponder()
    }

    // MARK: - Navigation

    @IBSegueAction func makeSelectUserViewController(_: NSCoder) -> SelectUserTableViewController? {
        return nil
    }

    // MARK: - IBActions

    @IBAction func cancel(_: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func save(_: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func updateSelectedUser(_: UIStoryboardSegue) {}
}
