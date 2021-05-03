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

    @IBOutlet var _companyname: UITextField!
    @IBOutlet var _role: UITextField!
    @IBOutlet var _description: UITextField!
    @IBOutlet var _startdate: UITextField!
    @IBOutlet var _enddate: UITextField!
    @IBOutlet var _linktoapply: UITextField!
    var urlString = String()
    
    //when screen clicked on load the view
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        
        _companyname.text = company_arr[cell_clicked]
        _role.text = role_arr[cell_clicked]
        _description.text = description_arr[cell_clicked]
        _startdate.text = start_date_arr[cell_clicked]
        _enddate.text = end_date_arr[cell_clicked]
        _linktoapply.text = link_arr[cell_clicked]
        urlString = link_arr[cell_clicked]
        
        
        _companyname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _role.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _description.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _startdate.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _enddate.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _linktoapply.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
    
    }
     
    //when the user taps apply go to the specific internship link 
    @IBAction func didTapApply(sender: AnyObject)
    {
        if let url = URL(string: urlString)
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)
         }
    }

}
