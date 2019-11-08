//
//  LoginViewController.swift
//  LectionUIKitTest
//
//  Created by Konstantin Polin on 31/10/2019.
//  Copyright © 2019 Konstantin Polin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet var nameText: UITextField!
	@IBOutlet var surnameText: UITextField!
	@IBOutlet var loginButton: UIButton!
    @IBOutlet var restoreButton: UIButton!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		nameText.delegate = self
		surnameText.delegate = self
		
		nameText.translatesAutoresizingMaskIntoConstraints = false
		surnameText.translatesAutoresizingMaskIntoConstraints = false
		loginButton.translatesAutoresizingMaskIntoConstraints = false
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
		
		let safeAreaGuide = view.safeAreaLayoutGuide
		
		var constraints = [NSLayoutConstraint]()
		
		constraints.append(nameText.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
		constraints.append(nameText.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor, constant: -120))
        constraints.append(nameText.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 30))
        constraints.append(nameText.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -30))
        
        constraints.append(surnameText.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
        constraints.append(surnameText.topAnchor.constraint(equalTo: nameText.bottomAnchor))
        constraints.append(surnameText.widthAnchor.constraint(equalTo: nameText.widthAnchor))
        
		constraints.append(loginButton.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 80))
		constraints.append(loginButton.trailingAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor, constant: -20))
        
        constraints.append(restoreButton.topAnchor.constraint(equalTo: loginButton.topAnchor))
        constraints.append(restoreButton.leadingAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor, constant: 20))

		
		NSLayoutConstraint.activate(constraints)
		
//		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@IBAction func onLoginTapped(_ sender: Any) {
		guard let name = nameText.text, let surname = surnameText.text else {
			 return
		}
        
        if name == "Svyatoslav" && surname == "Shevchenko" {
            performSegue(withIdentifier: "ShowImage", sender: self)
        } else {
            let alertController = UIAlertController(
                title: "ERROR!!!",
                message: "Your write incorrect name. Please write correct name",
                preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(
                title: "Close",
                style: .default,
                handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let imageVC = segue.destination as? ImageViewController {

            let name = nameText.text ?? ""
            let surname = surnameText.text ?? ""
            
            imageVC.name = name
            imageVC.surname = surname
        }
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
//	@objc func keyboardWillShow(notification: NSNotification) {
//        let value = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
//		let keyboardFrame = value.cgRectValue
//
//		if view.frame.origin.y == 0 {
//			view.frame.origin.y -= keyboardFrame.size.height
//		}
//	}
//
//	@objc func keyboardWillHide(notification: NSNotification) {
//		if view.frame.origin.y != 0 {
//			view.frame.origin.y = 0
//		}
//	}
	
}

