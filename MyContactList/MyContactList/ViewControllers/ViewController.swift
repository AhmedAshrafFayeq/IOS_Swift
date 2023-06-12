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
    var contactsSections = [[Contact]]()
    var contacts = [Contact]()
    let collation = UILocalizedIndexedCollation.current()
    var permissionExist = false
    var sectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestContactAccess()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.myContactsTableView.reloadData()
        }
    }

    func requestContactAccess() {
        contactsStore.requestAccess(for: .contacts) {[weak self] success, error in
            guard let self = self else {return}
            if success {
                print("Authorization Successfull")
                self.permissionExist = true
                self.shouldFetchContacts()
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
        request.sortOrder = CNContactSortOrder.userDefault
        do {
            try contactsStore.enumerateContacts(with: request, usingBlock: {contact, stoppingPointer in
                guard let phoneNumber = contact.phoneNumbers.first?.value.stringValue else {return}
                self.contacts.append(Contact(givenName: contact.givenName, familyName: contact.familyName, mobile: phoneNumber))
            })
            self.setupView()
        } catch let error{
            print("failed with error: ", error)
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
    
    func setupView() {
        let (arrayContacts, arrayTitles) = collation.partitionObjects(array: self.contacts, collationStringSelector: #selector(getter: Contact.givenName))
                self.contactsSections = arrayContacts as! [[Contact]]
                self.sectionTitles = arrayTitles

                print(contactsSections.count)
                print(sectionTitles.count)
        DispatchQueue.main.async {
            self.myContactsTableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contact = contactsSections[indexPath.section][indexPath.row]
        cell.textLabel?.text = contact.givenName + " " + contact.familyName
        cell.detailTextLabel?.text = contact.mobile
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return sectionTitles
    }
  
}

extension UILocalizedIndexedCollation {
    //func for partition array in sections
    func partitionObjects(array:[Contact], collationStringSelector:Selector) -> ([AnyObject], [String]) {
        var unsortedSections = [[Contact]]()

        //1. Create a array to hold the data for each section
        for _ in self.sectionTitles {
            unsortedSections.append([]) //appending an empty array
        }
        //2. Put each objects into a section
        for item in array {
            let index:Int = self.section(for: item, collationStringSelector:collationStringSelector)
            unsortedSections[index].append(item)
        }
        //3. sorting the array of each sections
        var sectionTitles = [String]()
        var sections = [AnyObject]()
        for index in 0 ..< unsortedSections.count { if unsortedSections[index].count > 0 {
            sectionTitles.append(self.sectionTitles[index])
            sections.append(self.sortedArray(from: unsortedSections[index], collationStringSelector: collationStringSelector) as AnyObject)
            }
        }
        return (sections, sectionTitles)
    }
}
