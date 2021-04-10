//
//  ViewController.swift
//  Art
//
//  Created by Alexa on 2/10/21.
//  Copyright © 2021 Alexa. All rights reserved.
//
import SideMenu
import UIKit

/*Main view controller*/
class ViewController: UIViewController
{
    //variables of front screen
    @IBOutlet var _username: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _login_button: UIButton!
    
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
    
    @IBAction func didTapForgotPassword()
    {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "ninth_vc") as! NinthViewController
        present(vc1,animated: true)
    }
    
    
    
    //working on buttons and two story boards
    @IBAction func didTapRegister()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        present(vc,animated: true)
    }
    
    

    @IBAction func LoginButton(_ sender: Any)
    {
//        if(_login_button.titleLabel?.text == "Logout")
//        {
//            let preferences = UserDefaults.standard
//            preferences.removeObject(forKey:"session")
//
//            LoginToDo()
//            return
//        }
//
        
        let username = _username.text
        let password = _password.text
        
        //if enters no user name then it wont allow u to go on
        if(username == "" || password == "")
        {
            return
        }
        
        DoLogin2(username!, password!)
        //gonna need some type of if statement here
        //DoLogin(username!, password!)
        
        //let vc3 = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "test") as! UINavigationController
        present(vc3, animated:true )
    }
    
    
    func DoLogin2(_ user:String, _ psw: String)
    {
        //let url = URL(string: "http://codeart.cs.loyola.edu/admin")!
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid

          let parameters = ["email": "admin@gmail.com", "password": "admin@OnlyPass!"]

          //create the url with URL
          let url = URL(string: "http://codeart.cs.loyola.edu/admin")! //change the url

          //create the session object
          let session = URLSession.shared

          //now create the URLRequest object using the url object
          var request = URLRequest(url: url)
          request.httpMethod = "POST" //set http method as POST

          do {
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
          } catch let error {
              print(error.localizedDescription)
          }

          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
          request.addValue("application/json", forHTTPHeaderField: "Accept")

          //create dataTask using the session object to send data to the server
          let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

              guard error == nil else {
                  return
              }

              guard let data = data else {
                  return
              }

              do {
                  //create json object from data
                  if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                      print(json)
                      // handle json...
                  }
              } catch let error {
                  print(error.localizedDescription)
              }
          })
          task.resume()
    }
    
    func DoLogin(_ user:String, _ psw:String)
    {
        print("inside do login ")
        let url = URL(string:"http://codeart.cs.loyola.edu/admin")
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url:url!)
        request.httpMethod = "POST"
        
        let paramToSend = "email=" + user + "&password=" + psw
        
        request.httpBody = paramToSend.data(using: .utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler:
            {
                (data, response, error) in
                
                guard let _:Data = data else
                {
                    return
                }
                let json:Any?
                
                do
                {
                    json = try JSONSerialization.jsonObject(with: data!, options: [])
                }
                catch
                {
                    json = nil
                }
                
                guard let server_response = json as? NSDictionary else
                {
                    return
                }
                
                if let data_block = server_response["data"] as? NSDictionary
                {
                    if let session_data = data_block["session"] as? String
                    {
                        let preferences = UserDefaults.standard
                        preferences.set(session_data,forKey:"session")
                        
                        DispatchQueue.main.async(
                            execute:self.LoginDone
                        )
                    }
                }
            })
        
        task.resume()
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

