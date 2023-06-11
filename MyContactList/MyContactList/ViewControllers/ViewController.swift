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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestContactAccess()
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetchContacts()
        }
    }


    func requestContactAccess() {
        contactsStore.requestAccess(for: .contacts) { success, error in
            if success {
                print("Authorization Successfull")
            }
        }
    }
    
    func fetchContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        try! contactsStore.enumerateContacts(with: request) { [weak self] contact, stoppingPointer in
            self?.contacts.append(Contact(givenName: contact.givenName, familyName: contact.familyName, number: contact.phoneNumbers.first?.value.stringValue ?? ""))
        }
        DispatchQueue.main.async {
            self.myContactsTableView.reloadData()
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
