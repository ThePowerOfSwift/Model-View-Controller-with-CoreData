//
//  HomeViewController.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapLogoutButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapDeleteUserButtonPressed(sender: UIButton) {
        //TODO: -CoreData
        DataStore.defaultLocalDB.deleteUser()
        
        
        //
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}
