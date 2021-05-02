//
//  SixthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/2/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import Alamofire
import DropDown


var age = Int()
var attributes = String()
var birthday = String()
var email = String()
var first_name = String()
var gender_ = String()
var graduation = String()
var last_name = String()

/*Profile Page*/
class SixthViewController: UIViewController
{
    @IBOutlet var _firstname: UITextField!
    @IBOutlet var _lastname: UITextField!
    @IBOutlet var _email: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _gradyear: UIButton!
    @IBOutlet var _birthdate: UITextField!
    @IBOutlet var _gender2: UIButton!
    @IBOutlet var _learnaboutCA: UIButton!

    let graduationYearDropDown = DropDown()
    let genderDropDown = DropDown()
    let learnCADropDown = DropDown()
    
    var graduationyear = String()
    var gender = String()
    var learnaboutca = String()
    
    
    //when view loads , load view from storyboard
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("id in profile is " , id)
        print("auth in profile is", auth)
        
        _firstname.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _lastname.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _email.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _password.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _birthdate.layer.borderColor =  UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _gradyear.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _gender2.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        _learnaboutCA.layer.borderColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0).cgColor
        
        _firstname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _lastname.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _email.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _password.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        _birthdate.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        
        _password.text = password2
        let idString = String(id)
        let authString = String(auth)
        print("id string is ", idString)
        let params = ["id": idString]
        let url = URL(string: "http://codeart.cs.loyola.edu/accountinfo?id="+idString+"&auth"+authString)!
        let h: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default/*URLEncoding.default*/, headers:nil).responseJSON
        { response in
            
            switch response.result
            {
                case .success(let value):
                debugPrint("PRINTING DEBUG: ", response)
                print(response)
                
                if let JSON = value as? [String: Any]
                {
                   first_name = JSON["first_name"] as! String
                   last_name = JSON["last_name"] as! String
                   email = JSON["email"] as! String
                   graduation = JSON["graduation"] as! String
                   age = JSON["age"] as! Int
                   gender_ = JSON["gender"] as! String
                   attributes = JSON["attributes"] as! String
                   birthday = JSON["birthday"] as! String
                   
                   let ageString = String(age)
                
                   print(first_name)
                   print(last_name)
                   print(email)
                   print(graduation)
                   print(ageString)
                   print(gender_)
                   print(attributes)
                    
                    self._firstname.text = first_name
                    self._lastname.text = last_name
                    self._email.text = email
                    self._birthdate.text = birthday
                    self._learnaboutCA.setTitle(attributes, for: .normal)
                    self._gradyear.setTitle(graduation,for: .normal)
                    self._gender2.setTitle(gender_, for: .normal)
                    
                }
                case .failure(let error):
                    print("error is ", error)
            }
     
        }
    }
    
    
    
    @IBAction func didYear(_ sender: UIButton)
    {
        graduationYearDropDown.dataSource = ["2021", "2022", "2023", "2024", "2025","2026"]
        graduationYearDropDown.anchorView = sender //5
        graduationYearDropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        graduationYearDropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        graduationYearDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        graduationYearDropDown.show() //7
        
        graduationYearDropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.graduationyear = item
        }
    }
    
    
    @IBAction func didGender(_ sender: UIButton)
    {
        genderDropDown.dataSource = ["Female", "Male", "Other"]
        genderDropDown.anchorView = sender //5
        genderDropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        genderDropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        genderDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        genderDropDown.show() //7
        
        genderDropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.gender = item
        }
    }
    
    @IBAction func didLearnAbout(_ sender: UIButton)
    {
        learnCADropDown.dataSource = ["Referred by someone", "Word of mouth", "Social media", "Online search", "Another organization", "Other"]
        learnCADropDown.anchorView = sender //5
        learnCADropDown.textFont = UIFont(name: "Gotham Rounded", size: 20.0)!
        learnCADropDown.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        learnCADropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        learnCADropDown.show() //7
        
        learnCADropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
            print("item selected is" , item)//9
            self?.learnaboutca = item
        }
    }
    
    
    
    
    
    
    
    
    //when the user clicks update , alert the user that their settings will be updated and follow through with the functionality
    @IBAction func didTapUpdate()
    {
        print("pressed update")
        var idString2 = String()
        idString2 = String(id)
        var authString2 = String()
        authString2 = String(auth)
        var new_firstname = String()
        new_firstname = self._firstname.text!
        var new_lastname = String()
        new_lastname = self._lastname.text!
        var new_email = String()
        new_email = self._email.text!
        var new_graduation = String()
        new_graduation = self._gradyear.currentTitle!
        var new_birthday = String()
        new_birthday = self._birthdate.text!
        var new_gender = String()
        new_gender = self._gender2.currentTitle!
        var new_attributes = String()
        new_attributes = self._learnaboutCA.currentTitle!
        var new_password = String()
        new_password = self._password.text!
        print(new_lastname)
        
        
        
        
        if((new_firstname ).isEmpty || (new_lastname ).isEmpty || (new_email).isEmpty || (new_password).isEmpty || (new_graduation).isEmpty || (new_birthday).isEmpty || (new_gender).isEmpty || (new_attributes).isEmpty)
        {
            //alert box
            let missingFields = UIAlertController(title: "Missing Information!", message: "Please fill in all fields.", preferredStyle: UIAlertController.Style.alert)
            missingFields.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                //self.dismiss(animated: true, completion: nil)
                }))
            self.present(missingFields, animated: true, completion: nil)
        }
        else
        {

            //do are u sure you want to update ?
        
        
        
        let refreshAlert = UIAlertController(title: "Update", message: "Are you sure you want to update your information? ", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

            
            let updated = UIAlertController(title: "Account Updated!", message: "Your account information has been saved.", preferredStyle: UIAlertController.Style.alert)
            updated.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                }))
            self.present(updated, animated: true, completion: nil)
            

            
            if new_password == password2
            {
                //missing password
                //"id": idString2,"is_admin": false, "is_student":true,
                let params2 = ["first_name":new_firstname, "last_name":new_lastname, "email":new_email, "graduation":new_graduation, "birthday":new_birthday, "gender":new_gender, "attributes":new_attributes,"password":password2, "is_admin":false, "is_student":true] as [String : Any]
                
                let url2 = URL(string: "http://codeart.cs.loyola.edu/accountmodify?id="+idString2+"&auth"+authString2)!
                let h: HTTPHeaders = ["Content-Type": "application/json"]
                
                AF.request(url2, method: .put, parameters: params2, encoding: JSONEncoding.default, headers:nil)
                
                    .responseJSON { response in
                        debugPrint("PRINTING DEBUG: ", response)
                        print("response is " , response.response!.statusCode)
                        switch response.result
                        {
                            case .success(let data):
                                print(response)
                                print("IN SUCCESS")
                                
                            case .failure(let error):
                                print("error is ", error)
                     }
                }


            }
            else
            {
                let params2 = ["first_name":new_firstname, "last_name":new_lastname, "email":new_email, "graduation":new_graduation, "birthday":new_birthday, "gender":new_gender, "attributes":new_attributes,"password":new_password, "is_admin":false, "is_student":true] as [String : Any]
                
                let url2 = URL(string: "http://codeart.cs.loyola.edu/accountmodify?id="+idString2+"&auth"+authString2)!
                let h: HTTPHeaders = ["Content-Type": "application/json"]
                
                AF.request(url2, method: .put, parameters: params2, encoding: JSONEncoding.default, headers:nil)
                
                    .responseJSON { response in
                        debugPrint("PRINTING DEBUG: ", response)
                        print("response is " , response.response!.statusCode)
                        switch response.result
                        {
                            case .success(let data):
                                print(response)
                                print("IN SUCCESS")
                                
                            case .failure(let error):
                                print("error is ", error)
                     }
                }


            }
            
            
//
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(refreshAlert, animated: true, completion: nil)
        }
    }
    
}
