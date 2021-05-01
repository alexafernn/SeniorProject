//
//  SecondViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit
import Alamofire

/*register view controller*/
class SecondViewController: UIViewController
{
    //variables of register screen screen
    @IBOutlet var _firstname: UITextField!
    @IBOutlet var _lastname: UITextField!
    @IBOutlet var _email: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _graduationyear: UITextField!
    @IBOutlet var _birthdate: UITextField!
    @IBOutlet var _gender: UITextField!
    @IBOutlet var _learnaboutca: UITextField!

    //when screen loads do this
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let graduationyear = _graduationyear.text
        let birthdate = _birthdate.text
        let gender = _gender.text
        let learnaboutca = _learnaboutca.text
        
        let empty_string = ""
        //testing
        print(firstname, lastname, email, password, graduationyear, birthdate, gender,learnaboutca)

        if((firstname ?? "").isEmpty || (lastname ?? "").isEmpty || (email ?? "").isEmpty || (password ?? "").isEmpty || (graduationyear ?? "").isEmpty || (birthdate ?? "").isEmpty || (gender ?? "").isEmpty || (learnaboutca ?? "").isEmpty)
        {
            //alert box
            let missingFields = UIAlertController(title: "Missing Info!", message: "Please fill in all fields", preferredStyle: UIAlertController.Style.alert)
            missingFields.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                //self.dismiss(animated: true, completion: nil)
                }))
            self.present(missingFields, animated: true, completion: nil)
        }
        else
        {
            let params = ["is_admin": false, "is_student":true, "first_name": firstname, "last_name": lastname, "email": email, "graduation": graduationyear, "birthday": birthdate, "gender": gender, "attributes": learnaboutca, "password": password] as [String : Any]
            
            let url = URL(string: "http://codeart.cs.loyola.edu/accountcreate")!
            let h: HTTPHeaders = ["Content-Type": "application/json"]
            
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers:h)
                .validate(statusCode: 200..<300)
                            /*.responseJson or .responseString*/
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
                                 }
                            }
        }
     
        
    }
    
}
