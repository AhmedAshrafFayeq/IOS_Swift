//
//  VerificationCodeViewController.swift
//  verificationCodeComponent
//
//  Created by Ahmed Fayek on 10/11/20.
//  Copyright © 2020 Ahmed Fayek. All rights reserved.
//

import UIKit

class VerificationCodeViewController: UIViewController {
   
    var viewItems: [UIView]             = []
    let walletPinDescriptionLabel       = UILabel()
    let enterPinLabel                   = UILabel()
    var pinTextFields: [UITextField]    = []
    
    @IBOutlet weak var pinStackView: UIStackView!
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    @IBOutlet weak var t4: UITextField!
    @IBOutlet weak var t5: UITextField!
    @IBOutlet weak var t6: UITextField!
    @IBOutlet weak var t7: UITextField!
    @IBOutlet weak var t8: UITextField!
    @IBOutlet weak var t9: UITextField!
    @IBOutlet weak var t10: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        t1.becomeFirstResponder()
    }
    
    func configure(){
        viewItems               = [walletPinDescriptionLabel, enterPinLabel, pinStackView]
        pinTextFields           = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]
        self.title              = "Verification Code"
        let padding: CGFloat    = 20
        let itemsSpace: CGFloat = 40
        
        pinStackView.distribution   = .fillEqually
        pinStackView.alignment      = .center
        
        for textFeild in pinTextFields {
            textFeild.layer.cornerRadius    = 4
            textFeild.clipsToBounds         = true
            textFeild.layer.borderWidth     = 1.0
            textFeild.layer.borderColor     = UIColor.green.cgColor
            textFeild.keyboardType          = .numberPad
            textFeild.textColor             = UIColor.green
            textFeild.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        }
        
        for viewItem in viewItems {
            view.addSubview(viewItem)
            viewItem.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                viewItem.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        walletPinDescriptionLabel.textAlignment             = .center
        walletPinDescriptionLabel.textColor                 = .gray
        walletPinDescriptionLabel.numberOfLines             = 3
        walletPinDescriptionLabel.adjustsFontSizeToFitWidth = true
        walletPinDescriptionLabel.text                      = "this is a description for why we should enter PIN code"
        
        enterPinLabel.textAlignment             = .center
        enterPinLabel.textColor                 = .gray
        enterPinLabel.adjustsFontSizeToFitWidth = true
        enterPinLabel.text                      = "Enter PIN code"
        
        NSLayoutConstraint.activate([
            walletPinDescriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: itemsSpace),
            walletPinDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            walletPinDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            enterPinLabel.topAnchor.constraint(equalTo: walletPinDescriptionLabel.bottomAnchor, constant: itemsSpace),
            
            pinStackView.topAnchor.constraint(equalTo: enterPinLabel.bottomAnchor, constant: padding),
            pinStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: itemsSpace),
            pinStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -itemsSpace),
            pinStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count == 1 {
            switch textField {
            case t1:
                t2.becomeFirstResponder()
            case t2:
                t3.becomeFirstResponder()
            case t3:
                t4.becomeFirstResponder()
            case t4:
                t5.becomeFirstResponder()
            case t5:
                t6.becomeFirstResponder()
            case t6:
                t7.becomeFirstResponder()
            case t7:
                t8.becomeFirstResponder()
            case t8:
                t9.becomeFirstResponder()
            case t9:
                t10.becomeFirstResponder()
            case t10:
                t10.resignFirstResponder()
            default:
                break
            }
        }
    }

}
