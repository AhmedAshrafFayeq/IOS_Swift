//
//  secondViewController.swift
//  delegateDemo
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    var str : String = ""
    var firstVC : ClearProtocol?    //object mn class be confirm el protocol
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func clearBtn(_ sender: UIBarButtonItem) {
        
        firstVC?.clear()  //--//--chaning safe   //optional gowah method   //hy unwrap b3d kda hynady 3l method clear
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text=str

        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
