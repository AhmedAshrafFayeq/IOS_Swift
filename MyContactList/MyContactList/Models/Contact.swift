//
//  Contact.swift
//  MyContactList
//
//  Created by Ahmed Fayek on 11/06/2023.
//

import Foundation

@objc class Contact : NSObject {
    @objc var givenName: String!
    @objc var familyName: String!
    @objc var mobile: String!

    init(givenName: String, familyName: String, mobile: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.mobile = mobile
    }
}

struct ContactsSection {
    let contactsGroup: [Contact]
}
