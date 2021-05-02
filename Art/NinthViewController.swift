//
//  NinthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
//import iOSDropDown
import DropDown
//forgot password view

class NinthViewController: UIViewController
{
    let dropDown = DropDown()
//    @IBOutlet weak var dropDown: DropDown!
    //when view clicked on load the view from story board
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
//        dropDown.optionArray = ["2021", "2022","2023","2024","2025","2026"]
//        dropDown.didSelect{(selectedText, index, id)  in
//            print("selected string: \(selectedText) \n index: \(index)")
//            
//        }
//        dropDown.showList()
//        dropDown.title
        
    
      
    }
    
    @IBAction  func tapChooseMenuItem(_ sender: UIButton)
    {//3
        dropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]//4
        dropDown.anchorView = sender //5
        dropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        dropDown.backgroundColor =  .white
        dropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
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
