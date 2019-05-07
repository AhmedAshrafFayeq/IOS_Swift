//
//  ViewController.swift
//  EmployeeManagerLab
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatedLabel: UILabel!
    @IBOutlet weak var salTextField: UITextField!
    @IBAction func employeeBtn(_ sender: UIButton) {
        var value : String = salTextField.text!
        var doubleValue : Double = Double(value)!
        var employeeObj = Employee(personSal: doubleValue)
        
        calculatedLabel.text = String (employeeObj.getSalary())
        
        
    }
    @IBAction func managerBtn(_ sender: UIButton) {
        var value : String = salTextField.text!
        var doubleValue : Double = Double(value)!
        var managerObj = Manager(personSal: doubleValue)
        
        calculatedLabel.text = String (managerObj.getSalary())
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

