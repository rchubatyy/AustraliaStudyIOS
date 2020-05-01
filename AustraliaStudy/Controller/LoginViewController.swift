//
//  ViewController.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/8/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var birthDateField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    lazy var birthDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "en-AU")
        picker.datePickerMode = .date
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AuthService.instance.loggedIn {
            //performSegue(withIdentifier: "logIn", sender: nil)
        }
        
        self.hideKeyboardWhenTappedAround()
        self.emailField.delegate = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(birthDateSelected))
        toolbar.setItems([done],animated:false)
        self.birthDateField.inputView = birthDatePicker
        self.birthDateField.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }*/

    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
        return false
        }
        else if birthDateField.text == "" {
            return birthDateField.becomeFirstResponder()
        }
        else {
            showLoginButton()
            return true
        }
    }
    
    

    @objc func birthDateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        birthDateField.text = dateFormatter.string(from: birthDatePicker.date)
        if emailField.text != "" {
            showLoginButton()
        }
        else {
            emailField.becomeFirstResponder()
        }
        
    }
    
    func showLoginButton(){
        loginButton.isHidden = false
        self.view.endEditing(true)
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        //performSegue(withIdentifier: "logIn", sender: nil)
    }
    
}

