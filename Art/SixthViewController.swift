//
//  SixthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/2/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapUpdate()
    {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//        present(vc,animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
