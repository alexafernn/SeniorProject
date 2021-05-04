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
    @IBOutlet var _forgot: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        _forgot.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
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
