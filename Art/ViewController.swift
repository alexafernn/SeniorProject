//
//  ViewController.swift
//  Art
//
//  Created by Alexa on 2/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//
import SideMenu
import UIKit
import Alamofire

var id = Int()
var auth = String()

/*Main view controller*/
class ViewController: UIViewController 
{
    //variables of front screen
    @IBOutlet var _username: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _login_button: UIButton!
    
    //when screen loads do this
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let preferences = UserDefaults.standard
        if(preferences.object(forKey: "session") != nil)
        {
            LoginDone()
        }
        else
        {
            LoginToDo()
        }
        
    }
    
    //if pressed on forgot password go to that screen
    @IBAction func didTapForgotPassword()
    {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "ninth_vc") as! NinthViewController
        present(vc1,animated: true)
    }
    
    //if pressed on register go to that screen
    @IBAction func didTapRegister()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        present(vc,animated: true)
    }
    
    //when pressed on login button grab user name and password and go to do login function
    @IBAction func LoginButton(_ sender: Any)
    {
        let username = _username.text
        let password = _password.text

        DoLogin4(username!, password!)
    }
    
    //call to the database and verify the username/password combo exist and deal with the result
    func DoLogin4(_ user:String, _ psw: String)
    {

        let username = user
        let password = psw
        
        print("username is: ")
        print(username)
        print("password is: ")
        print(password)
        
        if (username == "" || password == "")
        {
            print("entered no user and/or password")
            let missingCredenital = UIAlertController(title: "Sign in Failed!", message: "Please enter Username and Password", preferredStyle: UIAlertController.Style.alert)
            missingCredenital.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(missingCredenital, animated: true, completion: nil)
        }
        else
        {
            let h: HTTPHeaders = ["Content-Type": "application/json"]
            print("in else , they entered both login credentials")
            let p = ["email": username, "password": password]
            let url = URL(string: "http://codeart.cs.loyola.edu/account/login")!
            AF.request(url, method: .post, parameters: p, encoding: JSONEncoding.default/*URLEncoding.default*/, headers:h)
                .validate(statusCode: 200..<300)
                            /*.responseJson or .responseString*/
                                .responseJSON { response in
                                    
                                    debugPrint("PRINTING DEBUG: ", response)
                                    print("response is " , response.response!.statusCode)
                                    switch response.result
                                    {
                                        case .success(let value):
                                            print(response)
                                            print("IN SUCCESS")

                                            if let JSON = value as? [String: Any]
                                            {
                                               id = JSON["id"] as! Int
                                               auth = JSON["auth"] as! String
                                               print(id)
                                               print(auth)
                                            }
                                     
                                            let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "test") as! UINavigationController
                                            self.present(vc3, animated:true )
                                            
                                        case .failure(let error):
                                            print("error is ", error)
                                            let wrongLogin = UIAlertController(title: "Sign in Failed!", message: "Please enter correct Username and Password", preferredStyle: UIAlertController.Style.alert)
                                            wrongLogin.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                                    self.dismiss(animated: true, completion: nil)
                                                }))
                                            self.present(wrongLogin, animated: true, completion: nil)
                                 }
                            }
            }
    }
    
    func LoginToDo()
    {
        _username.isEnabled=true
        _password.isEnabled=true
        //_login_button.setTitle("Login", for: .normal)
    }

    func LoginDone()
    {
        _username.isEnabled=false
        _password.isEnabled=false
      //  _login_button.setTitle("Logout", for: .normal)
    }
}

