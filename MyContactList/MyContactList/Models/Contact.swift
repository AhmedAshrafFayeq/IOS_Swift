//
//  Contact.swift
//  MyContactList
//
//  Created by Ahmed Fayek on 11/06/2023.
//

import Foundation
import Contacts

struct Contact {
    let contact: CNContact
}

struct ContactsSection {
    let contactsGroup: [Contact]
}
