//
//  LoginViewController.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTaploginButton(sender: UIButton) {
        var inputDictionary = [String: AnyObject]()
        inputDictionary["name"] = self.nameTextField.text
        inputDictionary["password"] = self.passwordTextField.text
        let userModel = UserModel(inputDictionary: inputDictionary)
        self.loginUserWithModel(userModel)
        
    }
    
    @IBAction func didTapDismisButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func loginUserWithModel(userM: UserModel) {
        if DataStore.defaultLocalDB.loginUser(userM) {
            print("Succes: User logged!")
            let homeViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeVC") as! HomeViewController
            self.presentViewController(homeViewController, animated: true, completion: nil)
        } else {
            print("Failure: User did not store!")
        }
    }
}
