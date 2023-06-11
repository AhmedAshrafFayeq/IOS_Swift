//
//  ViewController.swift
//  MyContactList
//
//  Created by Ahmed Fayek on 11/06/2023.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var myContactsTableView: UITableView!
    
    let contactsStore = CNContactStore()
    var contacts = [Contact]()
    var permissionExist = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestContactAccess()
        shouldFetchContacts()
    }


    func requestContactAccess() {
        contactsStore.requestAccess(for: .contacts) {[weak self] success, error in
            guard let self = self else {return}
            if success {
                print("Authorization Successfull")
                self.permissionExist = true
            } else {
                self.showAlert()
            }
        }
    }
    
    func shouldFetchContacts() {
        if permissionExist {
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                self?.fetchContacts()
            }
        }
    }
    
    func fetchContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        do {
            try contactsStore.enumerateContacts(with: request) { [weak self] contact, stoppingPointer in
            guard let self = self else {return}
            self.contacts.append(Contact(givenName: contact.givenName, familyName: contact.familyName, number: contact.phoneNumbers.first?.value.stringValue ?? ""))
            }
        } catch let error{
            print("failed with error: ", error)
        }
        DispatchQueue.main.async { [weak self] in
            self?.myContactsTableView.reloadData()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Permission denied", message: "Go To Settings", preferredStyle: .alert)
        let confirmationButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(confirmationButton)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.givenName + " " + contact.familyName
        cell.detailTextLabel?.text = contact.number
        
        return cell
    }
    
    
}
