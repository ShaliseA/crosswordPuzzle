//
//  LoginViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/13/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Constants
    let loginToList = "LoginToList"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
/*creating an authentication using addStateDidChangeListener(). The block takes two parameters: auth and user*/
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil { //test the value of user
                /*when user authentification is successful, user is populated with the user's information. If the authentification fails, the variable is nil.*/
                self.performSegue(withIdentifier: self.loginToList, sender: nil) //on successful authentification, perform the segue and clear the text fields' text.
                self.textFieldLoginEmail.text = nil
                self.textFieldLoginPassword.text = nil
            }
        }
    }
    
    // MARK: Actions
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        guard
            let email = textFieldLoginEmail.text,
            let password = textFieldLoginPassword.text,
            email.count > 0,
            password.count > 0
            else {
                return
        }
        /*authenticate the user when they attempt to log in by tapping the Login button*/
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        /*get the email and password as supplied by the user from the
            alert controller*/
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            /*call createUser on the default firebase auth object
                passing the email and password*/
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
                if error == nil { //if there are no errors, the use account has been created. but the new user still needs to be authenticated so we call signIn.
                    Auth.auth().signIn(withEmail: self.textFieldLoginEmail.text!,
                                       password: self.textFieldLoginPassword.text!)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
}
