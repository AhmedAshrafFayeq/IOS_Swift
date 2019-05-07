//
//  File.swift
//  EmployeeManagerLab
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

class Person {
    var salary : Double?
    init(personSal sal : Double) {
        salary=sal
    }
    func getSalary ( ) ->Double{
        return salary!
    }
}

class Manager: Person {
    
    override func getSalary() -> Double {
        return salary! * 2
    }
}

class Employee: Person {
    
    override func getSalary() -> Double {
        return salary! * 1.5
    }
}
