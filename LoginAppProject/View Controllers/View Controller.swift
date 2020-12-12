////
////  ViewController.swift
////  LoginAppProject
////
////  Created by Vladimir Syleimanov on 11.12.2020.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginWindow: UITextField!
    @IBOutlet var passwordWindow: UITextField!
       
    private let userName = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "logIn" else { return }
//        let welcomeVC = segue.destination as! UITabBarController
//        welcomeVC.userName = loginWindow.text
    }
    
    @IBAction func logInPressed() {
        guard
            loginWindow.text == userName,
            passwordWindow.text == password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordWindow)
            return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oh no, you stupid asshole!",
                  message: "Your login is \(userName)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Oh my godness!",
                  message: "Your password is \(password)")
    }

    @IBAction func segueAction(segue: UIStoryboardSegue) {
        loginWindow.text = "Text"
        passwordWindow.text = "Password"
    }
}
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)

    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginWindow {
            textField.resignFirstResponder()
            passwordWindow.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}
