//
//  SecondViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didCancel()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func didSignUp()
    {
        self.dismiss(animated: true, completion: nil);
        //need to save the stuff to the database 
    }
    

}
