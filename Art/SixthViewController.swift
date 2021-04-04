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
    
//    lazy var internshipsController = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
//    lazy var eventsController = storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
//    lazy var profileController = storyboard?.instantiateViewController(withIdentifier: "sixth_vc") as! SixthViewController
//    lazy var homeController = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTapUpdate()
    {
        
        let refreshAlert = UIAlertController(title: "Update", message: "Are you sure you want to update your information?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//            self.present(vc,animated: true)

        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(refreshAlert, animated: true, completion: nil)
        print("pressed update")
//        self.dismiss(animated: true)

  
    }
    
}
