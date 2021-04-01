//
//  ThirdViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

/*check out view controller*/
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func didTapInternships()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
        present(vc,animated: true)
    }
    
    
    @IBAction func didTapEvents()
    {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
        present(vc2,animated: true)
    }

}
