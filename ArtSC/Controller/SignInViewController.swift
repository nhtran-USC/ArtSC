//
//  SignInViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "huy23tran11"
        passwordTextField.text = "123"
    }
    
    let BASE_URL = "http://localhost:8000/user/api/login/"
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var parameters = ["username": "", "password": ""]
    
    @IBAction func signInButtonDidTap(_ sender: Any) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        loginRequest(username: email, password: password)
    }
    
    
    
    func loginRequest(username: String, password:String) {
        guard let url = URL(string: BASE_URL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        parameters["username"] = username
        parameters["password"] = password
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
            UserService.shared.fetchUser(data: data)
            
            DispatchQueue.main.async {
                guard let user = UserService.shared.user else {
                    let alert = UIAlertController(title: "User not Found", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                if(user.status == "successful") {
                    CategoryService.shared.fetchCategoryResponse()
                    UserDefaults.standard.set(true, forKey: "isLoggedin")
                    self.performSegue(withIdentifier: "signInToHomeSegue", sender: nil)
                }
                else {
                    let alert = UIAlertController(title: "Unsucessful Login", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }.resume()
        
    }
}

extension SignInViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            self.passwordTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return false
    }
}
