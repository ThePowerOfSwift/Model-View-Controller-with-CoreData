//
//  SignUpViewController.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapSignUpButtonPressed(sender: UIButton) {
        // Save user details in CoreData
        var inputDictionary = [String: AnyObject]()
        inputDictionary["name"] = self.nameTextField.text
        inputDictionary["password"] = self.passwordTextField.text
        let userModel = UserModel(inputDictionary: inputDictionary)
        self.createUser(userModel)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didTapDismisButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func createUser(userM: UserModel) {
        DataStore.defaultLocalDB.createuser(userM)
    }
    
    func userCreationShow(isSaved: Bool) {
        if isSaved {
            print("Success: User Created")
        } else {
            print("Error: User not created!")
        }
    }
}
