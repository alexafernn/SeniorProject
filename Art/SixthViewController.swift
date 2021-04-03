//
//  SixthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/2/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController
{
    
//    lazy var internshipsController = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
//    lazy var eventsController = storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
//    lazy var profileController = storyboard?.instantiateViewController(withIdentifier: "sixth_vc") as! SixthViewController
//    lazy var homeController = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //addChildControllers()
        
        // Do any additional setup after loading the view.
    }

//    private func addChildControllers()
//    {
        
//        //adding child to child controller
//        addChild(internshipsController)
//        addChild(eventsController)
//        addChild(profileController)
//        addChild(homeController)
//
//        //adding the childs view
//        view.addSubview(internshipsController.view)
//        view.addSubview(eventsController.view)
//        view.addSubview(profileController.view)
//        view.addSubview(homeController.view)
//
//        //setting view to be size of the whole screen
//        internshipsController.view.frame = view.bounds
//        eventsController.view.frame = view.bounds
//        profileController.view.frame = view.bounds
//        homeController.view.frame = view.bounds
//
//        //you are a child under parent
//        internshipsController.didMove(toParent: self)
//        eventsController.didMove(toParent: self)
//        profileController.didMove(toParent: self)
//        homeController.didMove(toParent: self)
//
//        internshipsController.view.isHidden = true
//        eventsController.view.isHidden = true
//        profileController.view.isHidden = true
//        homeController.view.isHidden = true
//    }
    
    @IBAction func didTapUpdate()
    {
//        self.internshipsController.view.isHidden = true
//        self.eventsController.view.isHidden = true
//        self.profileController.view.isHidden = true
//        self.homeController.view.isHidden = false 
       // self.dismiss(animated: true, completion: nil)
//       let vc = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//       present(vc,animated: true)
    }
    
}
