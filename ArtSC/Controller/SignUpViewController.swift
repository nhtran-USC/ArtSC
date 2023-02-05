//
//  SignUpViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    


    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    let BASE_URL = "http://localhost:8000/user/api/register/"
    var parameters = ["username": "", "password": "", "first_name" : "", "last_name" : "", "email" : ""]
    
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let userName = userNameTextField.text
        else {
            return
        }
        loginRequest(username: userName, password: password, firstName: firstName, lastName: lastName, email: email)
    }
    
    
    func loginRequest(username: String, password:String, firstName: String, lastName: String, email:String) {
        guard let url = URL(string: BASE_URL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        parameters["username"] = username
        parameters["password"] = password
        parameters["first_name"] = firstName
        parameters["last_name"] = lastName
        parameters["email"] = email
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
        } catch {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else { return }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch {
                print("no data")
            }
            UserService.shared.fetchUser(data: data)
            
            DispatchQueue.main.async {
                guard let user = UserService.shared.user else {
                    let alert = UIAlertController(title: "User Not Found", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                if(user.status == "successful") {
                    CategoryService.shared.fetchCategoryResponse()
                    UserDefaults.standard.set(true, forKey: "isLoggedin")
                    self.performSegue(withIdentifier: "signUpToHomeSegue", sender: nil)
                }
                else {
                    let alert = UIAlertController(title: "No Good Login", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }.resume()
        
    }

    
    
}



extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == userNameTextField) {
            self.firstNameTextField.becomeFirstResponder()
        }
        else if (textField == firstNameTextField) {
            self.lastNameTextField.becomeFirstResponder()
        }
        else if (textField == lastNameTextField) {
            self.emailTextField.becomeFirstResponder()
        }
        else if (textField == emailTextField) {
            self.passwordTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return false
    }
}
