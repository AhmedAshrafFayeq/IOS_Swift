//
//  ViewController.swift
//  delegateDemo
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ClearProtocol{
    
    
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! secondViewController
        secondVC.str=myTextField.text!
        secondVC.firstVC = self     //--//--- bb3tlo el view bta3y -bb3t nfsy- //34an al clear yshofha  
        
    }
    func clear() {
        myTextField.text=""
    }
    

}

