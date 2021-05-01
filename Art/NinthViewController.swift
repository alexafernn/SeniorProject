//
//  NinthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import iOSDropDown
//forgot password view

class NinthViewController: UIViewController
{
    @IBOutlet weak var dropDown: DropDown!
    //when view clicked on load the view from story board
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        dropDown.optionArray = ["2021", "2022","2023","2024","2025","2026"]
        dropDown.didSelect{(selectedText, index, id)  in
            print("selected string: \(selectedText) \n index: \(index)")
            
        }
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
