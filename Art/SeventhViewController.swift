//
//  SeventhViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/4/21.
//  Copyright © 2021 Alexa. All rights reserved.
//
import SafariServices
import UIKit

/*internship details*/
class SeventhViewController: UIViewController
{

    //when screen clicked on load the view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
    }
     
    //when the user taps apply go to the specific internship link 
    @IBAction func didTapApply(sender: AnyObject)
    {
        if let url = URL(string: "https://www.google.com")
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)
         }
    }

}
