//
//  NinthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

class NinthViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapReset(sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func didTapCancel(sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil);
    }


}
