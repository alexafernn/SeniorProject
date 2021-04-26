//
//  SixthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/2/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import Alamofire


var age = Int()
var attributes = String()
var birthday = String()
var email = String()
var first_name = String()
var gender = String()
var graduation = String()
var last_name = String()

/*Profile Page*/
class SixthViewController: UIViewController
{
    @IBOutlet var _firstname: UITextField!
    @IBOutlet var _lastname: UITextField!
    @IBOutlet var _email: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _graduationyear: UITextField!
    @IBOutlet var _birthdate: UITextField!
    @IBOutlet var _gender: UITextField!
    @IBOutlet var _learnaboutCodeArt: UITextField!

    
    //when view loads , load view from storyboard
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("id in profile is " , id)
        print("auth in profile is", auth)
        
        _password.text = password2
        let idString = String(id)
        let authString = String(auth)
        print("id string is ", idString)
        let params = ["id": idString]
        let url = URL(string: "http://codeart.cs.loyola.edu/accountinfo?id="+idString+"&auth"+authString)!
//        let url = URL(string: "http://codeart.cs.loyola.edu/accountinfo")!
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
                   gender = JSON["gender"] as! String
                   attributes = JSON["attributes"] as! String
                   birthday = JSON["birthday"] as! String
                   
                   let ageString = String(age)
                
                   print(first_name)
                   print(last_name)
                   print(email)
                   print(graduation)
                   print(ageString)
                   print(gender)
                   print(attributes)
                    
                    self._firstname.text = first_name
                    self._lastname.text = last_name
                    self._email.text = email
                    self._graduationyear.text = graduation
                    self._gender.text = gender
                    self._learnaboutCodeArt.text = attributes
                    self._birthdate.text = birthday
                    
                }
                case .failure(let error):
                    print("error is ", error)
            }
     
        }
    }
    
    //when the user clicks update , alert the user that their settings will be updated and follow through with the functionality
    @IBAction func didTapUpdate()
    {
        print("pressed update")
        let refreshAlert = UIAlertController(title: "Update", message: "Are you sure you want to update your information? This will require you to log back in.", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
//            
//            let stringAge =
            
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
            new_graduation = self._graduationyear.text!
            var new_birthday = String()
            new_birthday = self._birthdate.text!
            var new_gender = String()
            new_gender = self._gender.text!
            var new_attributes = String()
            new_attributes = self._learnaboutCodeArt.text!
            var new_password = String()
            new_password = self._password.text!
            print(new_lastname)
            
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
