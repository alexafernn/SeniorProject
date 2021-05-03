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
class EighthViewController: UIViewController
{
    
    @IBOutlet var _eventname: UITextField!
    @IBOutlet var _organizers: UITextField!
    @IBOutlet var _location: UITextField!
    @IBOutlet var _date: UITextField!
    @IBOutlet var _description: UITextField!
    @IBOutlet var _cost: UITextField!
    @IBOutlet var _eventlinktoapply: UITextField!
    var eventUrlString = String()

    //when the view is clicked on load the view
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _eventname.text = event_name_arr[event_cell_clicked]
        _organizers.text = event_organizers_arr[event_cell_clicked]
        _location.text = event_location_arr[event_cell_clicked]
        _date.text = event_date_arr[event_cell_clicked]
        _description.text = event_description_arr[event_cell_clicked]
        _cost.text = event_cost_arr[event_cell_clicked]
        _eventlinktoapply.text = event_link_arr[event_cell_clicked]
        eventUrlString = event_link_arr[event_cell_clicked]
         
        
        _eventname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _organizers.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _location.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _date.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _description.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _cost.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _eventlinktoapply.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
    }
    
    //when the user clicks get tickets take them to the third party website 
    @IBAction func didTapGetTickets(sender: AnyObject)
    {
        if let url = URL(string: eventUrlString)
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)
         }
    }

}
