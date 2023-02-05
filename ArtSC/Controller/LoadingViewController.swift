//
//  LoadingViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let user = UserService.shared.user {
            self.performSegue(withIdentifier: "loadingToHomeSegue", sender: nil)
        }
        self.performSegue(withIdentifier: "loadingToSignInSegue", sender: nil)
        


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
