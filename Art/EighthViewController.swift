//
//  EighthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/4/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import SafariServices

/*Events Details Page*/
class EighthViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
    }
    
    
    @IBAction func didTapGetTickets(sender: AnyObject)
    {
        if let url = URL(string: "https://www.google.com")
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)
         }
    }

}
