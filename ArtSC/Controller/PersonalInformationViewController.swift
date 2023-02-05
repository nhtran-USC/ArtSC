//
//  PersonalInformationViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class PersonalInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.layer.cornerRadius = 10
        profileImageView.layer.cornerRadius = 75
        profileImageView.layer.borderWidth = 1
        
        guard let user = UserService.shared.user else {
            fatalError("how tf did I got here????")
        }
        userNameLabel.text = "User Name: " + user.first_name + " " + user.last_name
        emailLabel.text = "Email: " + user.email
    }
    
    @IBAction func logOutButtonDidTap(_ sender: Any) {
        UserService.shared.user = nil
        UserDefaults.standard.set(false, forKey: "isLoggedin")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var logOutButton: UIButton!
}
