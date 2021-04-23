//
//  SixthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/2/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
/*Profile Page*/
class SixthViewController: UIViewController
{
    //when view loads , load view from storyboard
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //when the user clicks update , alert the user that their settings will be updated and follow through with the functionality
    @IBAction func didTapUpdate()
    {
        print("pressed update")
        let refreshAlert = UIAlertController(title: "Update", message: "Are you sure you want to update your information? This will require you to log back in.", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //let vc = self.storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//            let vc = ThirdViewController()
//            self.present(vc,animated: true)
//
            self.dismiss(animated: true, completion: nil)
            
           // self.navigationController?.popViewController(animated: true)
         
           // self.performSegue(withIdentifier: "third_vc", sender: self)

     
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(refreshAlert, animated: true, completion: nil)
        
    }
    
}
