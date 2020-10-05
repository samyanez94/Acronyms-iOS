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

    var selectedUser: User? {
        didSet {
            userLabel.text = selectedUser?.name
        }
    }

    var acronym: Acronym?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        acronymShortTextField.becomeFirstResponder()

        // Populate user field.
        populateUsers()
    }

    // MARK: - Navigation

    @IBSegueAction func makeSelectUserViewController(_ coder: NSCoder) -> SelectUserTableViewController? {
        guard let user = selectedUser else {
            return nil
        }
        return SelectUserTableViewController(coder: coder, selectedUser: user)
    }

    // MARK: - IBActions

    @IBAction func cancel(_: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func save(_: UIBarButtonItem) {
        guard let shortText = acronymShortTextField.text,
            !shortText.isEmpty else {
            ErrorPresenter.showError(message: "You must specify an acronym!", on: self)
            return
        }
        guard let longText = acronymLongTextField.text,
            !longText.isEmpty else {
            ErrorPresenter.showError(message: "You must specify a meaning!", on: self)
            return
        }
        guard let userID = selectedUser?.id else {
            let message = "You must have a user to create an acronym!"
            ErrorPresenter.showError(message: message, on: self)
            return
        }
        let acronym = Acronym(
            short: shortText,
            long: longText,
            userID: userID
        )
        ResourceRequest<Acronym>(resourcePath: "acronyms").save(acronym.toCreateData()) { [weak self] result in
            switch result {
            case .failure:
                let message = "There was a problem saving the acronym"
                ErrorPresenter.showError(message: message, on: self)
            case .success:
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

    @IBAction func updateSelectedUser(_ segue: UIStoryboardSegue) {
        guard let controller = segue.source as? SelectUserTableViewController else {
            return
        }
        selectedUser = controller.selectedUser
    }

    // MARK: - Helpers

    func populateUsers() {
        let usersRequest = ResourceRequest<User>(resourcePath: "users")
        usersRequest.getAll { [weak self] result in
            switch result {
            case .failure:
                let message = "There was an error getting the users"
                ErrorPresenter.showError(message: message, on: self) { _ in self?.navigationController?.popViewController(animated: true)
                }
            case let .success(users):
                DispatchQueue.main.async { [weak self] in
                    self?.userLabel.text = users[0].name
                }
                self?.selectedUser = users[0]
            }
        }
    }
}
