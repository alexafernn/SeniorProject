//
//  SecondViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import Alamofire
import DropDown

/*Register fo an Account view controller*/
class SecondViewController: UIViewController
{
    //variables of register screen screen
    @IBOutlet var _firstname: UITextField!
    @IBOutlet var _lastname: UITextField!
    @IBOutlet var _email: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _birthdate: UITextField!
    @IBOutlet var _grad: UIButton!
    @IBOutlet var _gender: UIButton!
    @IBOutlet var _learnCA: UIButton!

    //Drop downs for button
    let graduationYearDropDown = DropDown()
    let genderDropDown = DropDown()
    let learnCADropDown = DropDown()
    
    //to store string from buttons 
    var graduationyear = String()
    var gender = String()
    var learnaboutca = String()
    
    //when screen loads do this
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //adding boreder color for all inputs
        _firstname.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _lastname.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _email.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _password.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _birthdate.layer.borderColor =  UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _grad.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _gender.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _learnCA.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        
        //adding text color for all inputs
        _firstname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _lastname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _email.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _password.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _birthdate.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
    }
    
    //Creating drop down for graduation year button
    @IBAction func didYear(_ sender: UIButton)
    {
        graduationYearDropDown.dataSource = ["2021", "2022", "2023", "2024", "2025","2026"]
        graduationYearDropDown.anchorView = sender //5
        graduationYearDropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        graduationYearDropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        graduationYearDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        graduationYearDropDown.show() //7
        
        graduationYearDropDown.selectionAction = { [weak self] (index: Int, item: String) in
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.graduationyear = item
        }
    }
    
    //Creating drop down for gender button
    @IBAction func didGender(_ sender: UIButton)
    {
        genderDropDown.dataSource = ["Female", "Male", "Other"]
        genderDropDown.anchorView = sender //5
        genderDropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        genderDropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        genderDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        genderDropDown.show() //7
        
        genderDropDown.selectionAction = { [weak self] (index: Int, item: String) in
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.gender = item
        }
    }
    
    //Creating drop down for how user learned about Code/Art button
    @IBAction func didLearnAbout(_ sender: UIButton)
    {
        learnCADropDown.dataSource = [ "Referred by someone", "Word of mouth", "Social media", "Online search", "Another organization", "Other"]
        learnCADropDown.anchorView = sender //5
        learnCADropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        learnCADropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        learnCADropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        learnCADropDown.show() //7
        
        learnCADropDown.selectionAction = { [weak self] (index: Int, item: String) in
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.learnaboutca = item
        }
        
        
    }
    
    //if tapped on cancel go back to main screen
    @IBAction func didCancel()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    //if tapped on did sign up , call on database and create the account and go back to main screen 
    @IBAction func didSignUp()
    {
        let firstname = _firstname.text
        let lastname = _lastname.text
        let email = _email.text
        let password = _password.text
        let birthdate = _birthdate.text

        //testing
        print(firstname, lastname, email, password, graduationyear, birthdate, gender,learnaboutca)

        //if parameter missing alert the user and dont let them go on
        if((firstname ?? "").isEmpty || (lastname ?? "").isEmpty || (email ?? "").isEmpty || (password ?? "").isEmpty || (graduationyear ).isEmpty || (birthdate ?? "").isEmpty || (gender ).isEmpty || (learnaboutca ).isEmpty)
        {
            //alert box
            let missingFields = UIAlertController(title: "Missing Information!", message: "Please fill in all fields.", preferredStyle: UIAlertController.Style.alert)
            missingFields.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                }))
            self.present(missingFields, animated: true, completion: nil)
        }
        else
        {
            //call on the database with json to create the account
                        
            let params = ["is_admin": false, "is_student":true, "first_name": firstname, "last_name": lastname, "email": email, "graduation": graduationyear, "birthday": birthdate, "gender": gender, "attributes": learnaboutca, "password": password] as [String : Any]
            
            let url = URL(string: "http://codeart.cs.loyola.edu/accountcreate")!
            let h: HTTPHeaders = ["Content-Type": "application/json"]
            
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers:h)
                .validate(statusCode: 200..<300)
                                .responseJSON { response in
                                    debugPrint("PRINTING DEBUG: ", response)
                                    print("response is " , response.response!.statusCode)
                                    switch response.result
                                    {
                                        case .success(let data):
                                            print(response)
                                            print("IN SUCCESS")
                                            self.dismiss(animated: true, completion: nil);
                                            
                                        case .failure(let error):
                                            print("error is ", error)
                                            //alert box if user entered incorrect birthday format 
                                            let incorrectBirthday = UIAlertController(title: "Incorrect Format", message: "Please enter your birthday in the correct format. (MM/DD/YY)", preferredStyle: UIAlertController.Style.alert)
                                            incorrectBirthday.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                                }))
                                            self.present(incorrectBirthday, animated: true, completion: nil)
                                 }
                            }
        }
     
        
    }
    
}

