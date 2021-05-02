//
//  NinthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

//forgot password view
class NinthViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //if user clicks on reset go back to main view
    @IBAction func didTapReset(sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    //if user clicks cancel go back to main view 
    @IBAction func didTapCancel(sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil);
    }


}
