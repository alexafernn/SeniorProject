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
    @IBOutlet var _firstname: UITextField!
    @IBOutlet var _lastname: UITextField!
    @IBOutlet var _email: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _graduationyear: UITextField!
    @IBOutlet var _birthdate: UITextField!
    @IBOutlet var _gender: UITextField!
    @IBOutlet var _learnaboutca: UITextField!

//    @IBOutlet var _firstname: UITextField!
//    @IBOutlet var _lastname: UITextField!
//    @IBOutlet var _email: UITextField!
//    @IBOutlet var _password: UITextField!
//    @IBOutlet var _graduationyear: UITextField!
//    @IBOutlet var _birthdate: UITextField!
//    @IBOutlet var _gender: UITextField!
//    @IBOutlet var _learnedAboutCodeArt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didCancel()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
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
        
        //testing
        print(firstname, lastname, email, password, graduationyear, birthdate, gender,learnaboutca)

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
        

        //self.dismiss(animated: true, completion: nil);
        //need to save the stuff to the database 
    }
    

}
