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
    var contactsSections = [ContactsSection]()
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
            var contacts = [Contact]()
            try contactsStore.enumerateContacts(with: request, usingBlock: {contact, stoppingPointer in
                contacts.append(Contact(contact: contact))
            })
            self.contactsSections = [ContactsSection(contactsGroup: contacts)]
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsSections[section].contactsGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contact = contactsSections[indexPath.section].contactsGroup[indexPath.row]
        cell.textLabel?.text = contact.contact.givenName + " " + contact.contact.familyName
        cell.detailTextLabel?.text = contact.contact.phoneNumbers.first?.value.stringValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section: \(section)"
    }
  
}
