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
//    var goodAuth = true;
    
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
//        if(username == "" || password == "")
//        {
//            return
//        }
        
        //DoLogin2(username!, password!)
        //gonna need some type of if statement here
        // print("good auth before")
        //print(goodAuth)
        //DoLogin3(username!, password!)
        //print(goodAuth)
       // if (goodAuth == true)
      //  {
//            let vc3 = storyboard?.instantiateViewController(withIdentifier: "test") as! UINavigationController
//            present(vc3, animated:true )
//        }
//
        
                
        DoLogin3(username!, password!)
//        print("getting to this point")
//        if(goodAuth == true)
////        let vc3 = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//        {
//            print("good auth = true")
//            let vc3 = storyboard?.instantiateViewController(withIdentifier: "test") as! UINavigationController
//            present(vc3, animated:true )
//        }
//        else
//        {
//            print("good auth = false")
//        }
    }
    
    
    //trying out new approach:
    func DoLogin3(_ user:String, _ psw: String)
    {
        let username = user
        let password = psw
        var goodAuth = false
        
        print("username is: ")
        print(username)
        print("password is: ")
        print(password)
           
        if (username == "" || password == "")
        {
            print("entered no user or password")
            let missingCredenital = UIAlertController(title: "Sign in Failed!", message: "Please enter Username and Password", preferredStyle: UIAlertController.Style.alert)
            missingCredenital.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(missingCredenital, animated: true, completion: nil)
        }
        else
        {
            print("in else , they entered login credentials")
            let parameters = ["email": username, "password": password]
            let url = URL(string: "http://codeart.cs.loyola.edu/login")!
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            request.httpMethod = "POST" //set http method as POST

            do
            {
                print("inside do")
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            }
            catch let error
            {
                print("inside error")
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
                    if let json = try JSONSerialization.jsonObject(with: data, options: /*.mutableContainers,*/ .allowFragments) as? [String: Any] {
                        print("inside if/do")
                        print(json)
                        // handle json...
                        print("goodAuth in if/do = ", goodAuth)
                        
                    }
                } catch let error {
                    print("inside catch")
                    goodAuth = false
                    print("good auth =", goodAuth)
                    print("error is ", error)
                    print(error.localizedDescription)
                }
            })
          //  print("at the end of login, goodAuth = ", goodAuth)
            task.resume()
        }
       
    }
 
     
//                var post:NSString = "username=\(username)&password=\(password)"
//
//                NSLog("PostData: %@",post);
//
//                var url:NSURL = NSURL(string: "https://dipinkrishna.com/jsonlogin2.php")!
//
//                var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
//
//                var postLength:NSString = String( postData.length )
//
//                var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
//                request.HTTPMethod = "POST"
//                request.HTTPBody = postData
//                request.setValue(postLength, forHTTPHeaderField: "Content-Length")
//                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//                request.setValue("application/json", forHTTPHeaderField: "Accept")
//
//
//                var reponseError: NSError?
//                var response: NSURLResponse?
//
//                var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
//
//                if ( urlData != nil ) {
//                    let res = response as NSHTTPURLResponse!;
//
//                    NSLog("Response code: %ld", res.statusCode);
//
//                    if (res.statusCode >= 200 && res.statusCode < 300)
//                    {
//                        var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
//
//                        NSLog("Response ==> %@", responseData);
//
//                        var error: NSError?
//
//                        let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
//
//
//                        let success:NSInteger = jsonData.valueForKey("success") as NSInteger
//
//                        //[jsonData[@"success"] integerValue];
//
//                        NSLog("Success: %ld", success);
//
//                        if(success == 1)
//                        {
//                            NSLog("Login SUCCESS");
//
//                            var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//                            prefs.setObject(username, forKey: "USERNAME")
//                            prefs.setInteger(1, forKey: "ISLOGGEDIN")
//                            prefs.synchronize()
//
//                            self.dismissViewControllerAnimated(true, completion: nil)
//                        } else {
//                            var error_msg:NSString
//
//                            if jsonData["error_message"] as? NSString != nil {
//                                error_msg = jsonData["error_message"] as NSString
//                            } else {
//                                error_msg = "Unknown Error"
//                            }
//                            var alertView:UIAlertView = UIAlertView()
//                            alertView.title = "Sign in Failed!"
//                            alertView.message = error_msg
//                            alertView.delegate = self
//                            alertView.addButtonWithTitle("OK")
//                            alertView.show()
//
//                        }
//
//                    } else {
//                        var alertView:UIAlertView = UIAlertView()
//                        alertView.title = "Sign in Failed!"
//                        alertView.message = "Connection Failed"
//                        alertView.delegate = self
//                        alertView.addButtonWithTitle("OK")
//                        alertView.show()
//                    }
//                } else {
//                    var alertView:UIAlertView = UIAlertView()
//                    alertView.title = "Sign in Failed!"
//                    alertView.message = "Connection Failure"
//                    if let error = reponseError {
//                        alertView.message = (error.localizedDescription)
//                    }
//                    alertView.delegate = self
//                    alertView.addButtonWithTitle("OK")
//                    alertView.show()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func DoLogin2(_ user:String, _ psw: String)
    {
        //let url = URL(string: "http://codeart.cs.loyola.edu/admin")!
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid

          let parameters = ["email": "a", "password": "a"]

          //create the url with URL
          let url = URL(string: "http://codeart.cs.loyola.edu/login")! //change the url

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
        let url = URL(string:"http://codeart.cs.loyola.edu/login")
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
                   // self.goodAuth = false
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

