//
//  PostViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        postButton.layer.cornerRadius = 45
        importButton.layer.cornerRadius = 16
        postButton.clipsToBounds = true
        importButton.clipsToBounds = true
        hiddenStackView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    let picker = UIImagePickerController()
    
    @IBAction func importButtonDidTap(_ sender: Any) {
        present(picker, animated: true)
    }
    
    @IBAction func postButtonDidTap(_ sender: Any) {
        
    }
    
    @IBOutlet weak var hiddenStackView: UIStackView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var importButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
}

extension PostViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.selectedImageView.image = image
         }
        
        dismiss(animated: true, completion: nil)
        hiddenStackView.isHidden = false
        
    }
}
