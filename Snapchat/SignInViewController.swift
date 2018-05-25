//
//  SignUpViewController.swift
//  Snapchat
//
//  Created by Adam Myhre on 2018-05-24.
//  Copyright © 2018 undergalaxie.com. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func turnUpTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: {(user, error) in
        print ("We tried to sign in")
            if error != nil {
                print ("Hey, we have an error!")
                Auth.auth().createUser(withEmail: self.emailTextfield.text!, password: self.passwordTextfield.text!, completion: {(user, error) in
                    print ("We tried to create a user")
                    
                    if error != nil {
                        print ("Hey, we have an error!")
                   
                    } else {
                        print ("Created user successfully")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                  }
                })
            } else {
                print ("Signed in successfully")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }})
        
    }

}

